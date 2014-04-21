Eromassage::Application.routes.draw do


  root to: 'application#index'

  resources :orders, only: :create
  resources :girls, only: [:index, :show]

  namespace :admin do
    resources :girls do
      resources :photos, only: [:create, :destroy]
    end

    resources :rooms do
      resources :photos, only: [:create, :destroy]
    end
  end
end
