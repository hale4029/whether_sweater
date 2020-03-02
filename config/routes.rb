Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: "forecasts#index"
      get '/backgrounds', to: "backgrounds#index"
      get '/munchies', to: "foods#index"
    end
  end
end
