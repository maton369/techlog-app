Rails.application.routes.draw do
  # get "posts/new"
  devise_for :users
  root 'home#top'

  resources :posts, only: [:new, :create, :show, :index]
end
