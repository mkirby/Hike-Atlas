Rails.application.routes.draw do
  root 'users#index'

  get '/sessions/new_login', to: 'sessions#new_login', as: 'new_login'
  post '/sessions/new_login', to: 'sessions#login'
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'

  resources :hike_items
  resources :user_hikes
  resources :items
  resources :categories
  resources :hikes
  resources :trails
	resources :users

end
