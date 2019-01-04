class DarkSkyFacade

  def initialize(location)
    @location = location
  end

  def forecast
    service.get_forecast
  end

  private

  attr_reader :location

  def service
    DarkSkyService.new(location)
  end
end
