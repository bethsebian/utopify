Rails.application.routes.draw do

  root 'home#index'

  resources :users, only: [:new, :create]

  resources :items, only: [:index]

  get '/dashboard', to: 'users#show'

  resources :travesties, only: [:show] do
    resources :items, only: [:index]
  end

  get '/cart', to: 'cart#show'

  resources :cart_items, only: [:create]
end
