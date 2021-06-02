module Api
  module V1
    class SpecialtiesController < ApplicationController
      before_action :authorized

      # GET /specialties
      def index
        @specialties = Specialty.all
        render json: SpecialtiesRepresenter.new(@specialties).as_json
      end
    end
  end
end
