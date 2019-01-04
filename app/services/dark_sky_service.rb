class DarkSkyService

  def initialize(location)
    @location = location
    @coords = get_coordinates
  end

  def get_forecast
    json = get_json("/forecast/#{ENV['dark_sky_key']}/#{@coords[:lat]},#{@coords[:lon]}?exlude=minutely")
  end

  private

  attr_reader :location

  def get_coordinates
    service = LocationService.new(location)
    service.find_coordinates
  end

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
