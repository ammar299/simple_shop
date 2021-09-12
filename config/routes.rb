Rails.application.routes.draw do
  root to: "home#index"
  resources :stores
  post 'user_token' => 'user_token#create'
  resources :orders
  devise_for :users

  namespace :admin do
    resources :products, except: %i[show]
    resources :regions, except: %i[show]
    resources :stores, except: %i[show]
  end
end
