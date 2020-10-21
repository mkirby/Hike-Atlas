Rails.application.routes.draw do
  root 'users#index'
  resources :hike_items
  resources :user_hikes
  resources :items
  resources :categories
  resources :hikes
  resources :trails
	resources :users

  #get '/', to: 'sessions#new_login', as: 'new_login'
	# post '/', to: 'sessions#create_login'
	# delete '/sessions/logout', to: 'sessions#logout', as: 'logout'
  
	# get '/login' => 'sessions#new' #get the login form?
  # post '/login' => 'sessions#create'  #verify crendtials to log in
  # post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
