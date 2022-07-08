# frozen_string_literal: true

Rails.application.routes.draw do
  resources :restaurants do
    resources :dishes
  
  end
  resources :orders
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "restaurants#index"
end
