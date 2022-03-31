Rails.application.routes.draw do
  resources :friends 
  mount ActionCable.server => '/cable'

  resources :posts do
    resources :comments
  end

  post "likes" => "likes#create"
  devise_for :users, controllers: {:registrations => 'users/registrations', :sessions => 'users/sessions'}
  root "posts#index"
end
