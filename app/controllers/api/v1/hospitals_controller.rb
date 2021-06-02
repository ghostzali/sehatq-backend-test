module Api
  module V1
    class HospitalsController < ApplicationController
      before_action :authorized

      # GET /hospitals
      def index
        @hospitals = Hospital.all
        render json: @hospitals
      end
    end
  end
end
