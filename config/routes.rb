Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'shops#index'
  resources :users, only: [:show]
  resources :cards
  resources :guests
  resources :categories
  resources :shops, shallow: true do
    resources :menus, only: [:new, :create, :edit, :update, :destroy]
    resources :blogs 
    resources :products do
      resources :transactions
    end
    collection do
      get 'search'
    end
    member do
      get 'blog'
      get 'menu'
    end

  end
  
end
