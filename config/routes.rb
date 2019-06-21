Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  root 'titles#index'
  resources :users, only: [:show]
  resources :genres, only: [:show]
  resources :titles, only: [:index, :create, :show] do
    resources :sentences, only: [:index, :new, :create]
  end
end
