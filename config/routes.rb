Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :posts do
    resources :comments
  end
  
  resources :posts do
    resources :likes, only: :create 
    delete "like" => "likes#destroy"
  end

  resources :users, only: %i[index update]
  resources :friends 
  
  get "users" => "users#index"
  get "search" => "users#search"
  
  post "create_comment/:id" => "comment_posts#create" , as: "create_comment"

  devise_for :users, controllers: {:registrations => 'users/registrations', :sessions => 'users/sessions'}
  root "posts#index"
end
