Rails.application.routes.draw do

  resources :items, only: [:index]

  resources :travesties, only: [:show] do
    resources :items, only: [:index]
  end

end
