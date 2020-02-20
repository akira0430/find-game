Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :topics
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'public_pages#home'
  get '/help', to: 'public_pages#help'
  post "/user/message" => "topics#email_user", as: :email_user
  resources :users
  resources :microposts do
    resources :likes, only: [:create, :destroy]
  end
end
