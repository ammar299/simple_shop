class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.new(user_params)
    return render json: {error: "Invalid email or password"} unless @user.valid?  

    @user.add_role :customer
    token = encode_token({user_id: @user.id})
    render json: {user: @user, token: token, roles: @user.roles.pluck(:name)}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token, roles: @user.roles.pluck(:name)}
    else
      render json: {error: "Invalid email or password"}
    end
  end


  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
