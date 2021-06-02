module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show]

      # GET /users
      def index
        @users = User.all
        render json: UsersRepresenter.new(@users).as_json
      end

      # GET /users/:id
      def show
        render json: UserRepresenter.new(@user).as_json
      end

      private
      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
