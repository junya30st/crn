Rails.application.routes.draw do
  devise_for :customers

  resources :customers
  resources :users
  resources :shops
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
