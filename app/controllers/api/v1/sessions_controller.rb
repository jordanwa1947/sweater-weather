class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    binding.pry

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user).serializable_hash
    else
      render_json_error(:not_found, :user_not_found)
    end
  end
end
