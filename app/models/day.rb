class Day
  attr_reader :date, :high_temp, :low_temp, :icon

  def initialize(day_info)
    @date = day_info[:time]
    @icon = day_info[:icon]
    @high_temp = day_info[:temperatureHigh]
    @low_temp = day_info[:temperatureLow]
  end
end
