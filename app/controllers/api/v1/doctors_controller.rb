module Api
  module V1
    class DoctorsController < ApplicationController
      before_action :authorized
      before_action :set_doctor, only: [:show]

      # GET /doctors
      def index
        if !params[:specialty_id].nil? && params[:hospital_id].nil?
          @doctors = Doctor.includes(:specialty, :hospitals).where(:specialty_id => params[:specialty_id])
        elsif !params[:hospital_id].nil? && params[:specialty_id].nil?
          @doctors = Doctor.includes(:specialty, :hospitals).joins(:hospitals).where(:hospitals => { :id => params[:hospital_id] })
        elsif !params[:specialty_id].nil? && !params[:hospital_id].nil?
          @doctors = Doctor.includes(:specialty, :hospitals).joins(:hospitals).where(:hospitals => { :id => params[:hospital_id] }, :specialty_id => params[:specialty_id])
        else
          @doctors = Doctor.all.includes(:specialty, :hospitals)
        end
        render json: DoctorsRepresenter.new(@doctors).as_json
      end

      # GET /doctors/:id
      def show
        if @doctor.nil?
          render json: { message: 'Not found'}, status: :not_found
        else
          doctor = DoctorRepresenter.new(@doctor)
          render json: { doctor: doctor.as_json, reservation: doctor.as_json_with_schedule[:schedules] }
        end
      end

      private
      def set_doctor
        @doctor = Doctor.includes(:specialty, :schedules, :hospitals).where(:id => params[:id]).first
      end
      def has_filter?
        !params[:specialty_id].nil? || !params[:hospital_id]
      end
    end
  end
end
