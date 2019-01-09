class GiphyService

  def get_gif(summary)
    ascii_only = summary.split('').find_all { |char| char.ascii_only? }.join('')
    get_json("/v1/gifs/search?q=#{ascii_only}&limit=1")
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
