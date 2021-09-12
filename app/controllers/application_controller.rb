class ApplicationController < ActionController::Base
  before_action :set_format
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def set_format
    request.format = :json
  end

  def encode_token(payload)
    JWT.encode(payload, ENV['SECRET_KEY_BASE'])
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, ENV['SECRET_KEY_BASE'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
