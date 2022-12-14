Rails.application.routes.draw do
  devise_for :users
  get 'likes/new'
  get 'likes/create'
  get 'likes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:index, :new, :create]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
