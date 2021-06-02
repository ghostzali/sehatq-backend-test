class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorized

  def encode_token(payload)
    JsonWebToken.encode(payload)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      JsonWebToken.decode(token)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: {message: 'Please login'}, status: :unauthorized unless logged_in?
  end

  private
  def logged_in_user
    payload = decoded_token
    if payload.nil?
      nil
    else
      user = User.find(payload[0]['user_id'])
      @login = user
      @is_admin = payload[0]['role'] == 'admin'
    end
  end

  def is_admin?
    @is_admin
  end
end
