class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      Favorite.create(user_id: user.id, location: params[:location])
    else
      render_json_error(:unauthorized, :access_denied)
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    favorites = user.favorites
    facade = DarkSkyFacade.new
    render json: facade.favorite_forecasts(favorites)
  end

  def delete
    user = User.find_by(api_key: params[:api_key])
    if user
      favorite = user.favorites.find_by(location: params[:location])
      favorite ? favorite.delete : render_json_error(:not_found, :favorite_not_found)
    else
      render_json_error(:unauthorized, :access_denied)
    end
  end
end
