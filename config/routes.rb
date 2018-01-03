Rails.application.routes.draw do
  devise_for :users 

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy ,:edit]

    collection do
      get :feeds

      get :ranking
    end

    member do
      get :dashboard
      # 其他程式碼
      post :favorite
      post :unfavorite

      post :like
      post :dislike

    end

  end

  resources :categories , only: :show
  root "restaurants#index"

  resources :users, only: [:index, :show, :edit, :update]

  resources :followships, only: [:create, :destroy]


  namespace :eichhorn do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end



end
