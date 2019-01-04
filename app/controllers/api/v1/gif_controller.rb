class Api::V1::GifController < ApplicationController

  def index
    giphy_facade = GiphyFacade.new(params[:location])
    render json: GiphySerializer.new(giphy_facade.giphy_forecasts).serializable_hash
  end
end
