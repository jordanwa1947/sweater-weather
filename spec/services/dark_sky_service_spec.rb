require 'rails_helper'

describe 'Dark Sky Service Fetches Weather Data' do
  it '.get_forecast' do
    VCR.use_cassette('dark_sky_api_response') do
      service = DarkSkyService.new('Denver, CO')
      forecast = service.get_forecast
      
      expect(forecast[:latitude]).to eq 39.7392364
      expect(forecast[:longitude]).to eq -104.9848623
      expect(forecast[:timezone]).to eq "America/Denver"
      expect(forecast[:daily][:data].count).to eq 8
      expect(forecast[:flags][:units]).to eq "us"
      expect(forecast[:offset]).to eq -7
    end
  end
end
