class Current
  attr_reader :current_temp,
              :time,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :summary

  def initialize(current_weather)
    @time = current_weather[:time]
    @current_temp = current_weather[:temperature]
    @feels_like = current_weather[:apparentTemperature]
    @humidity = current_weather[:humidity]
    @visibility = current_weather[:visibility]
    @uv_index = current_weather[:uvIndex]
    @summary = current_weather[:summary]
  end

end
