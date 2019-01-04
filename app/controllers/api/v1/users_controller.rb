class Api::V1::UsersController < ApplicationController

  def create
    new_user = User.new(user_params)
    if new_user.save
      new_user.api_key = SecureRandom.hex(13)
      render json: UserSerializer.new(new_user).serializable_hash
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end