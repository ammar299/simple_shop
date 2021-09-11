Rails.application.routes.draw do
  root to: "home#index"
  resources :stores
  post 'user_token' => 'user_token#create'
  resources :orders
  devise_for :users

  namespace :admin do
    resources :products
    resources :regions, except: %i[index show]
    resources :stores
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
