Rails.application.routes.draw do

  root 'home#index'



  resources :users, only: [:new, :create]

  resources :items, only: [:index, :show]

  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :travesties, only: [:show], param: :slug do
    resources :items, only: [:index]
  end

  get '/cart', to: 'carts#show'
  get '/orders', to: 'orders#index'

  resources :cart_items, only: [:create, :destroy]
end
