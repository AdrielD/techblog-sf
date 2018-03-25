Rails.application.routes.draw do
  resources :posts
  resources :sessions, only: [:create, :destroy]

  get 'login', to: "sessions#create", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'

  root to: "posts#index"

  mount ActionCable.server => '/cable'
end
