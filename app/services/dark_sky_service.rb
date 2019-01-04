class DarkSkyService

  def initialize(coordinates)
    @lat = coordinates[:lat]
    @lon = coordinates[:lon]
  end

  def get_forecast
    json = get_json("/forecast/#{ENV['dark_sky_key']}/#{lat},#{lon}?exlude=minutely")
    Forecast.new(json)
  end

  private

  attr_reader :lat, :lon

  def get_json(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'https://api.darksky.net') do |faraday|

      faraday.adapter Faraday.default_adapter
    end
  end


end
