Rails.application.routes.draw do
  root 'home#index'
  get '/cart', to: 'cart_items#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/search', to: 'home#search'

  resources :stores, only: [:show], param: :slug do
    resources :items, only: [:show], param: :slug
    resources :dashboard, only: [:index]
  end

  resources :categories, only: [:show, :index], param: :slug do
    resources :items, only: [:index]
  end

  namespace :store_admin do
    resources :dashboard, only: [:index]
  end

  namespace :platform_admin do
    resources :dashboard, only: [:index]
  end


  get '/dashboard', to: 'users#show'

  resources :cart_items, only: [:create, :update, :destroy]
  resources :orders, only: [:create, :index, :show, :update]
  resources :order_items, only: [:create]

  namespace :admin do
    get '/dashboard', to: 'base#show'
    resources :items, only: [:new, :create, :index, :destroy]
    resources :orders, only: [:index]
  end
  resources :reviews, only: [:index]
  resources :users, only: [:new, :create]



  # namespace :stores do
  #   resources :items, only: [:show]
  # end
  # #
  # namespace :stores, path: ":store", as: :store do #new stuff we added
  #   resources :dashboard, only: [:index]
  #   resources :items, only: [:show]
  # end
  # #

end
