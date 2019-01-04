class GiphyFacade

  def initialize(location)
    @location = location
    @forecasts = build_giphy_forecasts
  end

  def build_giphy_forecasts
    forecast = darksky_service.get_forecast
    service = giphy_service
    forecast[:daily][:data].map do |date|
      GiphyForecast.new(date, service)
    end
  end

  private
  attr_reader :location

  def darksky_service
    DarkSkyService.new(location)
  end

  def giphy_service
    GiphyService.new
  end
end
