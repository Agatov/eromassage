Eromassage::Application.routes.draw do


  namespace :admin do
    resources :girls do
      resources :photos, only: [:create, :destroy]
    end

    resources :rooms do
      resources :photos, only: [:create, :destroy]
    end
  end
end
