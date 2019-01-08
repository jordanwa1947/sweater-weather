module WeatherStubs

  def stub_denver_weather
    WebMock.stub_request(:get, "https://api.darksky.net/forecast/#{ENV['dark_sky_key']}/39.7392364,-104.9848623?exclude=minutely").
    to_return(body: File.read("./spec/fixtures/denver_weather.json"))
  end

  def stub_anchorage_weather
    WebMock.stub_request(:get, "https://api.darksky.net/forecast/#{ENV['dark_sky_key']}/61.2163129,-149.8948523?exclude=minutely").
    to_return(body: File.read("./spec/fixtures/anchorage_weather.json"))
  end

  def stub_tampa_weather
    WebMock.stub_request(:get, "https://api.darksky.net/forecast/#{ENV['dark_sky_key']}/27.9477595,-82.458444?exclude=minutely").
    to_return(body: File.read("./spec/fixtures/tampa_weather.json"))
  end
end
