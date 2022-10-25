Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :destroy, :new] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create]
    end
  end
  # root "articles#index"
end
