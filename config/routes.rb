Eromassage::Application.routes.draw do


  root to: 'application#index'

  resources :orders, only: :create

  resources :girls, only: :index
  resources :girl_comments, path: 'girls/:girl_id/comments', only: [:index, :create]

  resources :programs, only: :index

  namespace :admin do
    root to: 'girls#index'
    resources :girls do
      get 'schedule' => 'schedule#index'
      put 'schedule' => 'schedule#update'
      resources :photos, only: [:create, :destroy]
      collection do 
        resources :girls_comments, path: 'comments', only: [:index, :destroy, :edit, :update], controller: 'girls/comments'
      end
    end

    resources :rooms do
      resources :photos, only: [:create, :destroy]
    end

    resources :programs, except: [:show]
  end
end
