Rails.application.routes.draw do
  resources :posts

  root to: "posts#index"

  mount ActionCable.server => '/cable'
end
