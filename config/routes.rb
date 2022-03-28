Rails.application.routes.draw do
  resources :likes
  resources :friends
  mount ActionCable.server => '/cable'

  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: { :registrations => 'users/registrations', :sessions => 'users/sessions' }

  # devise_scope :user do
  #   authenticated :user do
  #     root 'home#index', as: :authenticated_root
  #   end
  #   unauthenticated do
  #     root 'devise/sessions#new', as: :unauthenticated_root
  #   end
  # end
 root "home#index" 
end
