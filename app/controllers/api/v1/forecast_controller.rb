class Api::V1::ForecastController < ApplicationController

  def show
    facade = DarkSkyFacade.new
    forecast = facade.forecast(params[:location])
    render json: ForecastSerializer.new(forecast).serializable_hash
  end
end
