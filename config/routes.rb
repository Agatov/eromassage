Eromassage::Application.routes.draw do
  root to: 'application#index'

  devise_for :users, skip: :registrations
  devise_scope :user do
    get '/users/sign_up' => 'devise/registrations#new', as: :new_user_registration
    post '/users'        => 'devise/registrations#create', as: :user_registration
  end
  resources :user, only: [:index, :update]

  resources :guestbook, only: :index do
    collection do
      post   'posts'     => 'guestbook#create_post'
      delete 'posts/:id' => 'guestbook#destroy_post', as: :post

      post 'posts/:post_id/comments' => 'guestbook#create_comment', as: :comments
    end
  end

  resources :comments, only: :destroy

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
