Rails.application.routes.draw do
  root to: "links#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/users', to: 'users#create'
  delete '/session', to: 'sessions#destroy'
  post '/links', to: 'links#create'

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
