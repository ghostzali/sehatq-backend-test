module ExceptionHandler
  extend ActiveSupport::Concern

  class DecodeError < StandardError; end
  class ExpiredSignature < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({error: e.message }, :not_found)
    end
    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ error: e.message }, :unprocessable_entity)
    end
    rescue_from ActiveRecord::RecordNotDestroyed do |e|
      json_response({ errors: e.record.errors }, :unprocessable_entity)
    end
    rescue_from ExceptionHandler::DecodeError do |_error|
      render json: { message: "Access denied!. Invalid token supplied." }, status: :unauthorized
    end
    rescue_from ExceptionHandler::ExpiredSignature do |_error|
      render json: { message: "Access denied!. Token has expired." }, status: :unauthorized
    end
  end
end
