class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] != params[:password_confirmation]
      render status: 422
    elsif
      new_user = user_params
      new_user[:email] = user_params[:email]
        user = User.new(new_user)
      if user.save
        render json: UsersSerializer.new(user), status: :created
      else
        render json: user.errors.full_messages, status: 422
      end
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
