class GiphyForecast

  def initialize(day, giphy_service)
    binding.pry
    @time = day[:time]
    @summary = day[:summary]
    @url = gif_url(giphy_service)
  end

  def gif_url(giphy_service)
    giphy_service.get_gif
  end
end
