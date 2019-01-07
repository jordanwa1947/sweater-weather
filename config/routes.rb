Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      post '/users', to: 'users#create'
      get '/gifs', to: 'gif#index'
      post '/sessions', to: 'sessions#create'
      post '/favorites', to: 'favorites#create'
      get '/favorites', to: 'favorites#index'
      delete '/favorites', to: 'favorites#delete'
    end
  end
end
