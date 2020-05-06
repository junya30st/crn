Rails.application.routes.draw do
  devise_for :customers

  root 'shops#index'
  resources :customers
  resources :users
  resources :shops do
    collection do
      get 'search'
    end
    resources :products
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
