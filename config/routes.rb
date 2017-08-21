Rails.application.routes.draw do  
  namespace :api, defaults: { format: :json } do
    namespace :sidebar do
      get :categories
      get :tags
    end

    resources :posts, only: [:index, :destroy] do
      resources :comments, only: [:index, :create, :destroy]
      get :search, on: :collection
    end
  end

  root 'react#index'
end
