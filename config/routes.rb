Rails.application.routes.draw do
  resources :users, only: :create
  resources :orders
  resources :items
  resources :sessions, only: %i[create destroy]
end
