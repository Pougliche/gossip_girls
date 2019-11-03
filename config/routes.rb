Rails.application.routes.draw do
  
  root to: 'users#new'

  resources :gossips 
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

end
