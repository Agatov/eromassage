Eromassage::Application.routes.draw do


  root to: 'application#index'

  resources :orders, only: :create

  namespace :admin do
    root to: 'girls#index'
    resources :girls do
      resources :photos, only: [:create, :destroy]
    end

    resources :rooms do
      resources :photos, only: [:create, :destroy]
    end
  end
end
