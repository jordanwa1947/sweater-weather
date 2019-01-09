class GiphyForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :daily_forecast
  set_id :time

  attributes :time, :summary, :url, :copyright
end
