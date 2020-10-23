Rails.application.routes.draw do
  root 'trails#index'

  get '/sessions/new_login', to: 'sessions#new_login', as: 'new_login'
  post '/sessions/new_login', to: 'sessions#login'
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'

  resources :hike_items, only: [:new, :create, :destroy]
  # resources :user_hikes
  resources :items, except: [:show]
  # resources :categories
  resources :hikes
  resources :trails, only: [:index, :show]
	resources :users, except: [:index, :destroy]

end
