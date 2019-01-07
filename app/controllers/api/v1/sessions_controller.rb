class Api::V1::SessionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error :user_not_found
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user).serializable_hash
    else
      render_json_error(:not_found, :user_not_found)
    end
  end
end
