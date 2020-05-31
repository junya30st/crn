Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'shops#top'
  resources :users, only: [:show]
  resources :cards, except: [:index, :edit, :update]
  resources :guests
  resources :categories
  resources :shops, shallow: true do
    resources :menus, except: [:index, :show]
    resources :blogs, except: [:index]
    resources :products, except: [:edit, :update] do
      resources :transactions
    end
    collection do
      get 'top'
      get 'search'
    end
    member do
      get 'blog'
      get 'menu'
    end

  end
  
end
