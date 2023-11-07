Rails.application.routes.draw do
  get 'rooms/index'
  resources :cars
  resources :electronics

  devise_for :users
  get 'user/:id', to: 'user#show', as: 'user'
  resources :posts
  resources :rooms

  root to: "home#index"
  get 'dashboard', to: "electronics#index", as: :dashboard 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do 
    namespace :v1 do 
      get 'posts' => 'posts#index'
      get "show/:id", to: 'posts#show'
    end
  end

end
