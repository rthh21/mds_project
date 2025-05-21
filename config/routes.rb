Rails.application.routes.draw do
  devise_for :users, controllers: {
  }
  namespace :admin do
    resources :events, only: [:edit, :update]
  end
  

  resources :events, only: [:new, :create, :index, :show]
  get "up" => "rails/health#show", as: :rails_health_check
  get 'dashboard', to: 'dashboard#show'
  get "dashboard/show"
  
  # root to: 'events#index'
  root to: 'welcome#index'
end