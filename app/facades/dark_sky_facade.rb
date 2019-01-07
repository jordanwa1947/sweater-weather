class DarkSkyFacade

  def forecast(location)
    Forecast.new(service(location).get_forecast)
  end

  def favorite_forecasts(favorites)
    favorites.map do |favorite|
      location = favorite.location
      {location: favorite, current_weather: forecast(location)}
    end
  end

  private

  attr_reader :location

  def service(location)
    DarkSkyService.new(location)
  end
end
