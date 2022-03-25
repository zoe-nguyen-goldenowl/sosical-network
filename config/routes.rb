Rails.application.routes.draw do
  resources :likes
  resources :posts
  
  mount ActionCable.server => '/cable'

  get 'home/index'
  get "users" =>"users#index"
  post "friend" =>"friends#create"
  get "friends" =>"friends#index"
  get "friend/:id"  =>"friends#show"

  delete "friend/:id" => "friends#destroy"

  put "friends" => "friends#update"

  get "users/detail/:id" => "users#show" ,as: 'user_detail'

  resources :friends

  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: { :registrations => 'users/registrations', :sessions => 'users/sessions' }

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
    
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
