class Api::V1::UsersController < ApplicationController
  def create
    new_user = user_params
    new_user[:email] = user_params[:email]
    user = User.create!(new_user)
    render json: UsersSerializer.new(user), status: :created
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
