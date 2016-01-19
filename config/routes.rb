Rails.application.routes.draw do
  devise_for :users
  # devise_for :users

  root 'locations#index'

  resources :locations do
    resources :reviews
  end

  end
