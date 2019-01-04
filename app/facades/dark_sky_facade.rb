class DarkSkyFacade

  def initialize(location)
    @location = location
  end

  def forecast
    service.get_forecast
  end

  private

  attr_reader :location

  def get_coordinates
    location_data = get_location_json
    {lat: location_data['lat'], lon: location_data['lon']}
  end

  def get_location_json
    geocoder_obj = Geocoder.search(location)
    geocoder_obj.first.data
  end

  def service
    DarkSkyService.new(get_coordinates)
  end
end
