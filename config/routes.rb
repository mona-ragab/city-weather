Rails.application.routes.draw do
  devise_for :users
  namespace :v1 do
    get '/weather', to: 'weather#search'
  end
  root to: 'city_weather#index'
  get '/search', to: 'city_weather#search'
end
