class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      render json: user.errors, status: :bad_request
    end
  end

  def show
    user = User.find_by(email: params[:email])
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end