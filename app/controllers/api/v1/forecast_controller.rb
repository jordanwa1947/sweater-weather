class Api::V1::ForecastController < ApplicationController

  def show
    facade = DarkSkyFacade.new(params[:location])
    render json: ForecastSerializer.new(facade.forecast).serializable_hash
  end
end
