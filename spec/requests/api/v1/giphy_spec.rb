require 'rails_helper'

describe 'Giphy Request' do
  describe 'api request is recieved for dark_sky' do
    it 'repsonds with an appropiate giphy for the day as well' do
      VCR.use_cassette('giphy_request', allow_playback_repeats: true) do
        stub_denver_weather
        get '/api/v1/gifs?location=Denver, CO'

        expect(response).to be_successful

        body = JSON.parse(response.body, symbolize_names: true)

        expect(body[:data].count).to eq(8)
        expect(body[:data].first[:attributes][:url]).to eq("https://giphy.com/gifs/pretty-sky-gorgeous-alEGxmahCCywE")
        expect(body[:data].first[:attributes][:summary]).to eq("Partly cloudy starting in the afternoon.")

        expect(body[:data].last[:attributes][:url]).to eq("https://giphy.com/gifs/dark-castle-63xBFHKNVjZlu")
        expect(body[:data].last[:attributes][:summary]).to eq("Mostly cloudy starting in the afternoon.")
      end
    end
  end
end
