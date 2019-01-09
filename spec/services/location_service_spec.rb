require 'rails_helper'

describe 'Location Service' do
  it 'gets coordinates' do
    service = LocationService.new('Denver, CO')
    coordinates = service.find_coordinates

    expect(coordinates[:lat]). to eq 39.7392364
    expect(coordinates[:lon]). to eq -104.9848623
  end
end
