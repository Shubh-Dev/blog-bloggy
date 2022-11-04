Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # resources :users, only: [:index] do
  # resources :api, only: [:index, :create]
  # end
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :create, :new, :destroy]
      resources :likes, only: [:create]
    end
  end
  # root "articles#index"
  root to: 'users#index'
  namespace :api do 
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :new, :create] do
          end
        end
      end
    end
  end
end
