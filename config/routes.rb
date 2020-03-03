Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: "forecasts#index"
      get '/backgrounds', to: "backgrounds#index"
      get '/munchies', to: "foods#index"

      post '/users', to: "users#create"
      post '/sessions', to: "sessions#create"

      post '/road_trip', to: 'trips#create'
    end
  end
end
