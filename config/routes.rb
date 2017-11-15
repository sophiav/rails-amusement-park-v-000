Rails.application.routes.draw do 
  root "application#welcome"

  resources :users
  resources :attractions
  resources :rides, only: [:create]

  # get '/signup' => "users#new"
  get '/signin' => "sessions#new"
  post 'signin' => "sessions#create"
  delete '/logout' => "sessions#destroy"
end