require 'rails_helper'

describe 'Giphy Request' do
  describe 'api request is recieved for dark_sky' do
    it 'repsonds with an appropiate giphy for the day as well' do

      get '/api/v1/gifs?location=denver,co'

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:date][:attributes][:daily_forecasts].count).to eq(8)
      expect(body[:date][:attributes][:daily_forecasts][:url]))
    end
  end
end
