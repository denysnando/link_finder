# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  root 'scrapes#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:new,  :create]
  resources :scrapes, only: [:index, :show, :create]

  mount Sidekiq::Web => '/sidekiq'
end
