Rails.application.routes.draw do

  devise_for :users
  resources :tweets
  resources :users do
    member do
        get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  root 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
