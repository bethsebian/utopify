Rails.application.routes.draw do

  get '/cart', to: 'carts#show'
  root 'home#index'

  resources :users, only: [:new, :create]

  resources :items, only: [:index, :show]

  get '/dashboard', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/update_quantity', to: "carts#update"

  resources :cart_items, only: [:create, :update, :destroy]
  resources :items, only: [:index, :show]
  resources :travesties, only: [:show], param: :slug do
    resources :items, only: [:index]
  end
  resources :users, only: [:new, :create]
  
  get '/cart', to: 'carts#show'
  get '/orders', to: 'orders#index'

  resources :cart_items, only: [:create, :destroy]
>>>>>>> order_implementation
end
