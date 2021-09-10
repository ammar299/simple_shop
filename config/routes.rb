Rails.application.routes.draw do
  resources :stores
  post 'user_token' => 'user_token#create'
  resources :orders
  resources :products
  resources :regions
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
