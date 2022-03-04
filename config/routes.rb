Rails.application.routes.draw do
  
  resources :likes
  resources :posts

  get 'home/index'
  get "users" =>"users#index"
  get "friend_add" =>"friends#create"
  get "friends" =>"friends#index"
  get "comments" => "comments#index"

  post "comments" => "comments#create"


  delete "friends" => "friends#destroy"
  delete "comments" => "comments#destroy"

  put "friends" => "friends#update"

  root to: "posts#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
