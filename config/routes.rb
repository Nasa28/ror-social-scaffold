Rails.application.routes.draw do
   get '/request_friendship/:id', to: 'friendships#create', as: :request_friendship
   patch '/confirm_request/:id', to: 'friendships#update', as: :confirm_request
   delete '/reject_request/:id', to: 'friendships#destroy', as: :reject_request
root 'posts#index'

  devise_for :users
  resources :friendships, only: %i[create update destroy]
 
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
