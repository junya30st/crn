Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    # :sessions => 'users/sessions'
  }

  root 'shops#index'
  resources :users, only: [:show]
  resources :guests
  resources :categories
  resources :shops do
    collection do
      get 'search'
    end
    resources :products
      resources :transactions
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
