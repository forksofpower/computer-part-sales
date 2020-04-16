Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/signout", to: "sessions#destroy"
  get 'authorized', to: "users#authorized" # test for auth

  resources :transactions
  resources :carts

  get '/carts/:id/add-listing', to: 'carts#add_listing'
  get '/cart/:id/remove-listing', to: 'carts#remove_listing'

  resources :listings, except: [:new, :create]
  resources :parts do
    resources :listings, only: [:new, :create]
    get '/listing', to: 'listings#show_listing'
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
