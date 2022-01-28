Rails.application.routes.draw do
  devise_for :users
  root to: 'bookmarks#index'
  resources :bookmarks, only: [:index, :new, :create, :show, :destroy] do
    resources :comments, only: [:index, :show, :create, :destroy]
  end
  resources :users, only: [:show]
end
