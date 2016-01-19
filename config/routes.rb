Rails.application.routes.draw do
  # devise_for :users


  resources :locations do
    resources :reviews
  end

  end
