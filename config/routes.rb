Rails.application.routes.draw do
  root 'trail#index'
  resources :hike_items
  resources :user_hikes
  resources :items
  resources :categories
  resources :hikes
  resources :trails
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
