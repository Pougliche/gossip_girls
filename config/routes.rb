Rails.application.routes.draw do
  resources :gossips do
    resources :users
  end 
  resources :users
end
