class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

  attributes :days do |forecast|
    forecast.days.map do |day|
      JSON.load day.to_json
    end
  end

  attributes :hours do |forecast|
    forecast.hours.map do |hour|
      JSON.load hour.to_json
    end
  end

  attributes :current do |forecast|
    JSON.load forecast.current.to_json
  end
end
