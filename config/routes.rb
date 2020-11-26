Rails.application.routes.draw do
  # Home controller
  root 'home#index'
  resources :contact, only: %i[index] # Resources
  devise_for :users
  resources :carts do
    resources :charges
  end
  resources :users do
    resources :orders
  end
  resources :artworks do
    resources :pictures
  end
  resources :categories

  resources :join_art_carts
end
