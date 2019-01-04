class GiphyService

  def get_gif(summary)
    get_json("/v1/gifs/search?q=#{summary}&limit=1")
  end

  private

  def get_json(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'https://api.giphy.com') do |faraday|
      faraday.params['api_key'] = ("#{ENV['giphy_key']}")

      faraday.adapter Faraday.default_adapter
    end
  end
end
