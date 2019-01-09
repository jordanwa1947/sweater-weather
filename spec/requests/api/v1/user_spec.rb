require 'rails_helper'

describe 'User Requst' do
  describe 'post request is received with user credentials' do
    it 'responds with an api key' do

      post '/api/v1/users', params: {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }

      expect(response).to be_successful

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:data][:attributes][:api_key])
    end
  end

  describe 'post request is received with invalid credentials' do
    it 'responds with an api key' do

      post '/api/v1/users', params: {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "paword"
      }

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:password_confirmation].first[:error]).to eq("confirmation")
      expect(body[:password_confirmation].first[:attribute]).to eq("Password")
    end
  end
end
