Rails.application.routes.draw do
  # get "posts/new"
  devise_for :users
  root 'posts#index'

  resources :posts, only: [:new, :create, :show, :index, :destroy]
end
