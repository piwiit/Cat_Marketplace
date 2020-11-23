Rails.application.routes.draw do
  # Home controller
  root 'home#index'
  get '/secret', to: 'home#secret'

  # Resources
  devise_for :users # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
