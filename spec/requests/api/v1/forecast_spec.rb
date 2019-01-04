require 'rails_helper'

describe 'Forecast Api Request' do
  it 'fetches forecast data from darksky api and returns json' do
    VCR.use_cassette('geocode_lookup') do
      VCR.use_cassette('dark_sky_forecast') do
        get '/api/v1/forecast?location=denver,co'

        expect(response).to be_successful

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body[:data][:type]).to eq("forecast")
        expect(body[:data][:attributes][:days].count).to eq(8)
        expect(body[:data][:attributes][:hours].count).to eq(49)
      end
    end
  end
end
