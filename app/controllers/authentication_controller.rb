class AuthenticationController < ApplicationController
  before_action :authenticate_request, only: [:authenticate, :create]
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    render json: {user: auth_token }
  end

  # we used strong parameters for the validation of params
  private

  def user_params
    params.permit(:name,:email,:password, :password_confirmation)
  end

end
