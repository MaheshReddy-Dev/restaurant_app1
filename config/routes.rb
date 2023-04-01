
Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :dishes, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :restaurants do
    resources :dishes, only: [:new, :create, :edit, :update, :destroy, :show]
    resources :reviews, only: [:create]
  end
  
  
  resources :dishes, only: [:show] do
  resources :reviews, only: [:create]
  end


  root to: "restaurants#index"
end
