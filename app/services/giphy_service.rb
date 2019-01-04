class GiphyService

  def get_gifs
    json = get_json('/v1/gifs/search')
    binding.pry
  end

  private

  def get_json(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'https://api.giphy.com') do |faraday|
      faraday.params("#{ENV['giphy_key']}")

      faraday.adapter Faraday.default_adapter
    end
  end
end
