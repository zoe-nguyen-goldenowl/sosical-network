Rails.application.routes.draw do
  resources :friends 
  mount ActionCable.server => '/cable'

  resources :posts do
    resources :comments
  end
  
  resources :posts do
    resources :likes, only: :create 
    delete "like" => "likes#destroy"
  end
  
  resources :users, only: %i[index update]
  
  get "users" => "users#index"
  devise_for :users, controllers: {:registrations => 'users/registrations', :sessions => 'users/sessions'}
  root "posts#index"
end
