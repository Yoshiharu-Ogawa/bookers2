Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users

  get 'homes/about'

  resources :users, only: [:show, :edit, :index, :update,]
  resources :books, only: [:new, :index, :show, :edit, :create ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
