class Api::V1::GifController < ApplicationController

  def index
    facade = DarkSkyFacade.new(params[:location])
    giphy_facade = GiphyFacade.new(facade.forecast.days)
    render json: GiphySerializer.new(giphy_facade.forecast_giphys).serializable_hash
  end
end
