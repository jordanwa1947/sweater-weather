class Forecast
  attr_reader :days, :hours, :current, :id

  def initialize(json)
    @id = 1
    @days = create_days(json[:daily])
    @hours = create_hours(json[:hourly])
    @current = Current.new(json[:currently])
  end

  def create_days(daily_info)
    daily_info[:data].map do |day_info|
      day = Day.new(day_info)
    end
  end

  def create_hours(hourly_info)
    hourly_info[:data].map do |hour_info|
      hour = Hour.new(hour_info)
    end
  end
end
