Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    # :sessions => 'users/sessions'
  }

  root 'shops#index'
  resources :users, only: [:show]
  resources :cards
  resources :guests
  resources :categories
  resources :shops, shallow: true do
    collection do
      get 'search'
    end
    resources :products do
      resources :transactions
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
