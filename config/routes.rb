Rails.application.routes.draw do
  get "errors/not_found"
  get "errors/internal_server_error"
  devise_for :users, controllers: {
  }
  namespace :admin do
    resources :events, only: [:edit, :update]
  end
  delete '/events/:id', to: 'events#destroy', as: 'event'
  

  resources :events, only: [:new, :create, :edit, :update, :index, :show]
  get "up" => "rails/health#show", as: :rails_health_check
  get 'dashboard', to: 'dashboard#show'
  get "dashboard/show"
  get 'about', to: 'about#show', as: :about
  
  match '*unmatched', to: 'errors#not_found', via: :all
  match '*unmatched', to: 'errors#internal_server_error', via: :all

  root to: 'welcome#index'
end