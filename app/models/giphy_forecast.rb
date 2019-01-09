class GiphyForecast
  attr_reader :time, :summary, :url, :copyright

  def initialize(day, giphy_service)
    @time = day[:time]
    @summary = day[:summary]
    @url = gif_url(giphy_service)
    @copyright = "2019"
  end

  def gif_url(giphy_service)
    gif = giphy_service.get_gif(@summary)
    gif[:data].first[:url]
  end
end
