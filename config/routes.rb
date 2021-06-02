Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    post '/login', to: 'auth#login'
    get '/me', to: 'auth#me'
    post '/register', to: 'auth#register'

    # Version 1
    namespace :v1 do
      resources :roles, only: [:index, :show]
      resources :users, only: [:index, :show]
      resources :doctors, only: [:index, :show]
      resources :specialties, only: [:index]
      resources :schedules, only: [:index]
      resources :hospitals, only: [:index]
      resources :orders, only: [:create]
    end
  end
end
