module Api
  class AuthController < ApplicationController
    before_action :authorized, only: [:me]

    # POST /login
    def login
      if params[:username].nil?
        @user = User.find_by_email(params[:email])
      else
        @user = User.find_by(username: params[:username])
      end

      if @user && @user.authenticate(params[:password])
        token = encode_token({ user_id: @user.id, role: @user.role.code })
        render json: { user: UserRepresenter.new(@user).as_json, token: token }
      else
        render json: { error: 'Invalid username or password' }
      end
    end

    # GET /me
    def me
      if @login.nil?
        nil
      else
        render json: { me: UserRepresenter.new(@login).as_json }
      end
    end

    # POST /register
    def register
      new_user = registration_params
      role = Role.find_by(code: 'customer')
      if role.nil?
        role = Role.create(code: 'customer', name: 'Customer')
      end
      new_user[:role_id] = role.id
      @user = User.create(new_user)
      if @user.save
        token = encode_token({user_id: @user.id})
        render json: { user: UserRepresenter.new(@user).as_json, token: token }
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private
    def registration_params
      params.permit(:username, :email, :password, :fullname)
    end
  end
end
