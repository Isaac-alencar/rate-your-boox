# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  get '/feed', to: 'home#feed'
  resources :users, only: %i[show edit update], param: :username
  resources :authors, only: %i[edit update new create]
  resources :books, only: %i[show edit update new create]
end
