require 'rails_helper'

describe 'Session Request' do
  describe 'a user sends a post request to session with the proper credentials' do
    it 'logs the user in' do
      user = User.create!(email: "whatever@example.com",
                   password: "password",
                   api_key: "jgn983hy48thw9begh98h4539h4")

      post '/api/v1/sessions', params: {
        "email": "whatever@example.com",
        "password": "password"
      }

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:data][:id].to_i).to eq(user.id)
      expect(body[:data][:attributes][:api_key]).to eq(user.api_key)
    end
  end

  describe 'a user sends a post request to session with the invalid credentials' do
    it 'sends an json error response' do
      user = User.create!(email: "whatever@example.com",
                   password: "password",
                   api_key: "jgn983hy48thw9begh98h4539h4")

      post '/api/v1/sessions', params: {
        "email": "whatevs@example.com",
        "password": "password"
      }

      expect(response).to_not be_successful

      body = JSON.parse(response.body, symbolize_names: true)

      expect(body[:errors].first[:title]).to eq("Could not find User")
      expect(body[:errors].first[:status]).to eq(404)
      expect(body[:errors].first[:detail]).to eq("This user does not exist, or has been deleted")
    end
  end
end
