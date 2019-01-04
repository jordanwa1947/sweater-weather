require 'rails_helper'

describe 'Giphy Request' do
  describe 'api request is recieved for dark_sky' do
    VCR.use_cassette('geocode_lookup') do
      VCR.use_cassette('dark_sky_forecast') do
        it 'repsonds with an appropiate giphy for the day as well' do

          get '/api/v1/gifs?location=denver,co'

          expect(response).to be_successful

          body = JSON.parse(response.body, symbolize_names: true)

          expect(body[:data].count).to eq(8)
          expect(body[:data].first[:attributes][:url])
          expect(body[:data].last[:attributes][:url])
        end
      end
    end
  end
end
