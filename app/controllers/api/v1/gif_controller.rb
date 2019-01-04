class Api::V1::GifController < ApplicationController

  def index
    giphy_facade = GiphyFacade.new(params[:location])
    days = giphy_facade.build_giphy_forecasts
    render json: GiphyForecastSerializer.new(days).serializable_hash
  end
end
