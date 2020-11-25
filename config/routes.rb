Rails.application.routes.draw do
  # Home controller
  root 'home#index'
  resources :contact, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Resources
  devise_for :users
  resources :carts

  resources :users do
    resources :orders
  end
  resources :artworks do
    resources :pictures
  end
  resources :categories
  resources :charges
  resources :join_art_carts
end
