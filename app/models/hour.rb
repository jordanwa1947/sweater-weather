class Hour
  attr_reader :time, :temperature, :icon 

  def initialize(hour_info)
    @time = hour_info[:time]
    @temperature = hour_info[:temperature]
    @icon = hour_info[:icon]
  end
end
