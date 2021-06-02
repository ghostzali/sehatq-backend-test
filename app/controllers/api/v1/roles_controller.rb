module Api
  module V1
    class RolesController < ApplicationController
      before_action :set_role, only: [:show]

      # GET /roles
      def index
        @roles = Role.all
        render json: RolesRepresenter.new(@roles).as_json
      end

      # GET /roles/:id
      def show
        render json: RoleRepresenter.new(@role).as_json
      end


      private
      def set_role
        @role = Role.find(params[:id])
      end
    end
  end
end
