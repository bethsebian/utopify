Rails.application.routes.draw do
  root 'home#index'

  get '/cart', to: 'cart_items#show'
  get '/dashboard', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/search', to: 'home#search'

  resources :cart_items, only: [:create, :update, :destroy]
  resources :order_items, only: [:create]
  resources :orders, only: [:create, :index, :show, :update]
  resources :users, only: [:new, :create]
  resources :items, only: [:new, :create, :edit, :update]
  resources :categories, only: [:show, :index, :edit, :update], param: :slug do
    resources :items, only: [:index]
  end

  resources :stores, only: [:show, :new, :create, :edit, :update], param: :slug do
    resources :items, param: :slug
    resources :dashboard, only: [:index]
  end

  namespace :platform_admin do
    resources :dashboard, only: [:index]
    scope ":store_slug" do
      resources :items, only: [:new, :create]
    end
  end
end
