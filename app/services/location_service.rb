class LocationService

  def initialize(location)
    @location = location
  end

  def find_coordinates
    location_data = get_location_json
    {lat: location_data['lat'], lon: location_data['lon']}
  end

  private
  attr_reader :location


  def get_location_json
    geocoder_obj = Geocoder.search(location)
    geocoder_obj.first.data
  end
end
