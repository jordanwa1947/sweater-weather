class GiphyForecast

  def initialize(day, giphy_service)
    @time = day[:time]
    @summary = day[:summary]
    @url = gif_url(giphy_service)
  end

  def gif_url(giphy_service)
    gif = giphy_service.get_gif(@summary)
    gif[:data].first[:url]
  end
end
