require 'rails_helper'

describe 'Favorite Requests' do
  describe 'client sends post request with api_key and location' do
    it 'adds a favorite to the associated user' do
      user = User.create!(email: "whatever@example.com",
                   password: "password",
                   api_key: "jgn983hy48thw9begh98h4539h4")

      post '/api/v1/favorites', params: { 'api_key' => user.api_key,
                                          'location' => 'Denver, CO'}

      expect(response).to be_successful
      expect(user.favorites.first.location).to eq 'Denver, CO'
    end
  end

  describe 'client sends post request with invalid credentials' do
    it 'adds a favorite to the associated user' do
      user = User.create!(email: "whatever@example.com",
                   password: "password",
                   api_key: "jgn983hy48thw9begh98h4539h4")

      post '/api/v1/favorites', params: { 'api_key' => "gn983hy48thw9begh98h4539h4",
                                          'location' => 'Denver, CO'}

      expect(response).to_not be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:errors].first[:title]).to eq("Unauthorized")
      expect(body[:errors].first[:status]).to eq(401)
      expect(body[:errors].first[:detail]).to eq("Access Denied")
    end
  end

  describe 'client sends get request to favorites with api_key' do
    it 'sends a response with all of a users favorites' do
      user = User.create(email: "whatever@example.com",
                   password: "password",
                   api_key: "jgn983hy48thw9begh98h4539h4")
      favorite_1 = Favorite.create!(location: 'Denver, CO', user_id: user.id)
      Favorite.create!(location: 'Tampa, Fl', user_id: user.id)
      Favorite.create!(location: 'Anchorage, Al', user_id: user.id)

      get '/api/v1/favorites', headers: {
        api_key: "jgn983hy48thw9begh98h4539h4"
      }

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[0][:location][:location]).to eq(favorite_1.location)
      expect(body[0][:location][:id]).to eq(favorite_1.id)
      expect(body[0][:location][:user_id]).to eq(user.id)
    end
  end

  describe 'client sends delete request to favorites with api_key' do
    it 'deletes the favorite' do
      user = User.create(email: "whatever@example.com",
                   password: "password",
                   api_key: "jgn983hy48thw9begh98h4539h4")
      Favorite.create!(location: 'Denver, CO', user_id: user.id)
      favorite_2 = Favorite.create!(location: 'Tampa, Fl', user_id: user.id)
      Favorite.create!(location: 'Anchorage, Al', user_id: user.id)

      expect(Favorite.find(favorite_2.id)).to eq favorite_2

      delete '/api/v1/favorites', headers: {
        location: favorite_2.location,
        api_key: "jgn983hy48thw9begh98h4539h4"
      }

      expect(response).to be_successful
      expect(Favorite.find_by(id: favorite_2.id)).to eq nil
    end
  end
end
