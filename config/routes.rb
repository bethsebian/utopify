Rails.application.routes.draw do

  resources :items, only: [:index]

  resources :travesties, only: [:show] do
    resources :items, only: [:index]
  end

  get '/cart', to: 'sessions#show'

  resources :cart_items, only: [:create]
end
