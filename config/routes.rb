Rails.application.routes.draw do
  resources :transactions
  resources :carts
  resources :parts
  resources :users
  resources :listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
