module Api
  module V1
    class SchedulesController < ApplicationController
      before_action :authorized

      # GET /schedules
      def index
        if params[:hospital_id].nil?
          @schedules = Schedule.includes(:doctor).all
        else
          @schedules = Schedule.includes(:doctor).joins(:doctor => :placements)
                               .where(:placements => { :hospital_id => params[:hospital_id] })
        end
        group = params[:group].to_s.downcase
        page = params[:page].nil? ? 1 : params[:page].to_s.to_i
        render json: SchedulesRepresenter.new(@schedules, group == 'date', page).as_json
      end
    end
  end
end
