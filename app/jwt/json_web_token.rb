class JsonWebToken
  JWT_SECRET = ENV["JWT_SECRET"]

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, JWT_SECRET)
  end

  def self.decode(token)
    JWT.decode(token, JWT_SECRET, true, algorithm: 'HS256')
  rescue JWT::VerificationError => e
    raise ExceptionHandler::VerificationError, e.message
  rescue JWT::ExpiredSignature => e
    raise ExceptionHandler::ExpiredSignature, e.message
  rescue JWT::DecodeError => e
    raise ExceptionHandler::DecodeError, e.message
  end
end
