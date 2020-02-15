Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :topics
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  #get "/users" => 'users#index', as: "users"
  root 'public_pages#home'
  get '/help', to: 'public_pages#help'
  post "/user/message" => "topics#email_user", as: :email_user
  #get '/users/:id', to: 'users#show', as: 'user'
  #delete "/user" => "users#show", as: "user_delete"
  resources :users
  resources :microposts do
    resources :likes, only: [:create, :destroy]
  end
end
