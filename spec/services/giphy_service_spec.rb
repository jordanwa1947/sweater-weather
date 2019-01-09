require 'rails_helper'

describe 'Service Fetches Gifs' do
  it '.get_gif' do
    VCR.use_cassette('giphy_request') do
      summary = "Partly cloudy throughout the day."
      service = GiphyService.new
      response = service.get_gif(summary)

      expect(response[:data]).to all(be_a(Hash))
      #Every time the cassette is deleted, this info needs to be updated
      first_gif = response[:data].first
      expect(first_gif[:type]).to eq("gif")
      expect(first_gif[:id]).to eq("aQ7kognlRPDzi")
      expect(first_gif[:url]).to eq("https://giphy.com/gifs/beach-clouds-aQ7kognlRPDzi")
    end
  end
end
