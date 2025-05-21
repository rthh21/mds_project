Rails.application.routes.draw do
  get "rooms/show"
  get "calls/show"
    devise_for :users, controllers: {
  }
  # config/routes.rb
  namespace :admin do
    resources :events, only: [:edit, :update]
  end
  
  # root to: 'events#index'
  root to: 'welcome#index'

  resources :events, only: [:index, :show]
  # WebRTC
  # mount ActionCable.server => '/cable'
  # root 'rooms#new'
  # get '/:room', to: 'rooms#show', as: :room
  # resources :calls, only: :create
  # resources :calls, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end