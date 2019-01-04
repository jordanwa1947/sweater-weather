class GiphyFacade

  def initialize(location)
    @location = location
    @forecasts = build_giphy_forecasts
  end
# potential memoizing could store gifs from same summary f
# or future use and less api calls
  def build_giphy_forecasts
    forecast = darksky_service.get_forecast
    forecast[:daily][:data].map do |date|
      GiphyForecast.new(date, giphy_service)
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
