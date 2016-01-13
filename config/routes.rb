Rails.application.routes.draw do

  root 'home#index'

  resources :users, only: [:new, :create]

  resources :items, only: [:index, :show]

  get '/dashboard', to: 'users#show'

  resources :travesties, only: [:show], param: :slug do
    resources :items, only: [:index]
  end

  get '/cart', to: 'carts#show'

  resources :cart_items, only: [:create, :destroy]
end
