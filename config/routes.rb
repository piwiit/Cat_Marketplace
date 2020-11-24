Rails.application.routes.draw do
  # Home controller
  root 'home#index'
  get '/secret', to: 'home#secret'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Resources
  devise_for :users do
    resources :carts
    resources :orders
  end
  resources :artworks
  resources :categories

end
