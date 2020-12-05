Rails.application.routes.draw do
  Rails.application.routes.draw do
    namespace :v1 do
      get '/weather', to: 'weather#search'
    end
  end
end
