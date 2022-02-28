Rails.application.routes.draw do
  resources :votes
  resources :posts
  get 'home/index'

  root to: "posts#index"
  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
