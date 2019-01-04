class GiphyFacade

  def initialize(forecasts)
    @daily_forecasts = build_forecasts(forecasts)

  end

  def build_forecasts(forecasts)
    forecasts.map do |forecast|
      GiphyForcast.new(forecast)
    end
  end
end
