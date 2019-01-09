class Api::V1::UsersController < ApplicationController

  def create
    new_user = User.new(user_params)
    if new_user.save
      new_user.api_key = SecureRandom.hex(13)
      new_user.save
      render json: UserSerializer.new(new_user).serializable_hash
    else
      render json: new_user.errors.details
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
