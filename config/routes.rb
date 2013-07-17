Eromassage::Application.routes.draw do


  root to: 'application#index'

  resources :orders, only: :create

  resources :girl_comments, path: 'girls/:girl_id/comments', only: [:index, :create]

  namespace :admin do
    root to: 'girls#index'
    resources :girls do
      get 'schedule' => 'schedule#index'
      put 'schedule' => 'schedule#update'
      resources :photos, only: [:create, :destroy]
    end

    resources :rooms do
      resources :photos, only: [:create, :destroy]
    end
  end
end
