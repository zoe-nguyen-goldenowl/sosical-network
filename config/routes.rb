Rails.application.routes.draw do
  
  resources :likes
  resources :posts

  get 'home/index'
  get "users" =>"users#index"
  get "friend_add" =>"friends#create"
  get "friends" =>"friends#index"

  delete "friends" => "friends#destroy"

  put "friends" => "friends#update"

  root to: "posts#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
