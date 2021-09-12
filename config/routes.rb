Rails.application.routes.draw do
  resources :stores
  resources :orders

  namespace :admin do
    resources :products, except: %i[show]
    resources :regions, except: %i[show]
    resources :stores, except: %i[show]
  end
end
