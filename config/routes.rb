Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  # devise_for :users

  root 'locations#index'

  resources :locations
  resources :users do
    resources :reviews
  end
  resources :reviews

end
