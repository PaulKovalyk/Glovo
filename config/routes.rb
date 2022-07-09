# frozen_string_literal: true

Rails.application.routes.draw do
  resources :restaurants do
    resources :dishes
  
  end
  resources :orders
  resources :line_items
  resources :carts
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'users' => 'application#routing_error'
  root "restaurants#index"
end
