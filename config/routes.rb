Rails.application.routes.draw do  
  namespace :api, defaults: { format: :json } do
    resources :categories, only: [:index, :create, :destroy]

    resources :posts, only: [:index, :create, :destroy] do
      resources :comments, only: [:index, :create, :destroy]
      get :search, on: :collection
    end
  end

  root 'react#index'
end
