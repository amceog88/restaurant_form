Rails.application.routes.draw do
  devise_for :users 

  resources :restaurants, only: [:index, :show]
  resources :categories , only: :show
  root "restaurants#index"

  resources :users, only: [:show, :edit, :update]


  namespace :eichhorn do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy ,:edit]
  end

end
