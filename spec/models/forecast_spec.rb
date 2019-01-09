require 'rails_helper'

describe 'Forecast Model' do

  before(:each) do
    request = stub_denver_weather
    json = request.response.body
    parsed_json = JSON.parse(json, symbolize_names: true)
    @forecast = Forecast.new(parsed_json)
  end

  it 'creates current' do
    expect(@forecast.current.class).to eq(Current)

    expect(@forecast.current.current_temp).to eq 46.18
    expect(@forecast.current.feels_like).to eq 44.98
    expect(@forecast.current.summary).to eq "Clear"
    expect(@forecast.current.time).to eq 1546907092
  end

  it 'creates days' do
    expect(@forecast.days).to all(be_a(Day))

    day = @forecast.days.first

    expect(day.date).to eq(1546844400)
    expect(day.high_temp).to eq(51.36)
    expect(day.icon).to eq("partly-cloudy-night")
    expect(day.low_temp).to eq(27.27)
  end

  it 'creates hours' do
    expect(@forecast.hours).to all(be_an(Hour))

    hour = @forecast.hours.first

    expect(hour.icon).to eq("clear-night")
    expect(hour.temperature).to eq(47.25)
    expect(hour.time).to eq(1546905600)
  end
end
