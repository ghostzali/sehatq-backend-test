module Api
  module V1
    class OrdersController < ApplicationController
      before_action :authorized

      # POST /orders
      def create
        new_order = order_params
        schedule_start = Time.parse("#{params[:date]} #{schedule.start_time.strftime('%H:%M')}")
        time_diff = (schedule_start - Time.now) / 60 # in minutes
        if new_order.nil?
          render json: { message: 'Bad request' }, status: :bad_request
        elsif !order.nil?
          data = {
            order: OrderRepresenter.new(order).as_json,
            hospital: hospital,
            patient: UserRepresenter.new(@login).as_json
          }
          render json: { message: 'Already have appointment', data: data }, status: :already_reported
        elsif count_queue >= 10
          render json: { message: 'Out of quota', total_queue: count_queue }, status: :unprocessable_entity
        elsif time_diff < 30
          render json: { message: 'Out of time' }, status: :unprocessable_entity
        else
          @order = Order.create(new_order)
          if @order.save
            render json: {
              order: OrderRepresenter.new(order).as_json,
              hospital: hospital,
              patient: UserRepresenter.new(@login).as_json
            }, status: :created
          else
            render json: { message: @order.errors }, status: :unprocessable_entity
          end
        end
      end

      private
      attr_reader :hospital, :schedule, :order, :count_queue
      def order_params
        new_order = nil
        if valid_params?
          @order = Order.includes(:schedule).where(:schedule_id => params[:schedule_id], :user_id => @login.id).first
          @hospital = Hospital.find(params[:hospital_id])
          @schedule = Schedule.find(params[:schedule_id])
          @count_queue = Order.includes(:schedule).where(:schedules => {:id => params[:schedule_id]}, :queue_date => params[:date]).count
          queue_date = Date.parse(params[:date])
          if queue_date.strftime('%A') == schedule.day_name
            new_order = {
              :code => "APT#{params[:hospital_id]}#{schedule.doctor_id}#{schedule.id}#{queue_date.strftime('%Y%m%d')}#{count_queue+1}",
              :schedule_id => schedule.id,
              :user_id => @login.id,
              :queue_date => queue_date,
              :queue_number => count_queue+1
            }
          end
        end
        new_order
      end
      def valid_params?
        !params[:schedule_id].nil? && !params[:hospital_id].nil? && !params[:date].nil?
      end
    end
  end
end
