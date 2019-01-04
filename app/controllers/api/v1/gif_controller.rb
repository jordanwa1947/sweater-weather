class Api::V1::GifController < ApplicationController

  def index
    facade = DarkSkyFacade.new(params[:location])
    render json: GiphySerializer.new(facade)
  end
end
