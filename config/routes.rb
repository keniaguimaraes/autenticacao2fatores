require 'sidekiq/web'

Rails.application.routes.draw do
  resources :blogs
  # Devise
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", sessions: "users/sessions" }
  devise_scope :user do
    scope :users, as: :users do
      post 'pre_otp', to: 'users/sessions#pre_otp'
    end
  end

  resource :two_factor

  # Admin
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications

    root to: "users#index"
  end

  devise_scope :user do
    scope :user, as: :user do
      get '/login' => 'devise/sessions#new'
      get '/logout' => 'devise/sessions#destroy'
    
    end
  end
  # Main app routes
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'

  root to: 'home#index'
  root to: 'blogs#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end