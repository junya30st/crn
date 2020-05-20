Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
    # :sessions => 'users/sessions'
  }

  root 'shops#index'
  resources :users, only: [:show]
  resources :cards
  resources :guests
  resources :categories
  resources :shops, shallow: true do
    resources :products do
      resources :transactions
    end
    collection do
      get 'search'
    end
  end
  
end
