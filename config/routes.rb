Rails.application.routes.draw do
  resources :friends 
  mount ActionCable.server => '/cable'

  resources :posts do
    resources :comments
  end

  resources :posts do
    resources :likes, only: %i[create]
    delete "like" => "likes#destroy"
  end
  
  get "users" => "users#index"
  devise_for :users, controllers: {:registrations => 'users/registrations', :sessions => 'users/sessions'}
  root "posts#index"
end
