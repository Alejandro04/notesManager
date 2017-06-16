class AuthenticationController < ApplicationController
  before_action :authenticate_request, only: [:authenticate, :create]
  skip_before_action :authenticate_request

 # GET form to user login
  def login

  end

 # GET form to user register
  def register

  end

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def create
    passone = params[:password]
    passtwo = params[:password_repeat]

    if(passone == passtwo)
      user = User.create!(user_params)
      auth_token = AuthenticateUser.new(user.email, user.password).call
      render json: {user: auth_token }
    else
     render json: { error: "Los passwords deben ser iguales "}
    end
  end


  # we used strong parameters for the validation of params
  private

  def user_params
    params.permit(:name,:email,:password, :password_confirmation)
  end

end
