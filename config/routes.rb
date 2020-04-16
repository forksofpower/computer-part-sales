Rails.application.routes.draw do
  get '/me', to: 'users#show_me'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/signout", to: "sessions#destroy"
  get 'authorized', to: "users#page_to_protect" # test for auth

  resources :transactions
  resources :carts do
    get '/listings/:listing_id/add', to: 'carts#add_listing', as: 'add_listing'
    get '/listings/:listing_id/remove', to: 'carts#remove_listing', as: 'remove_listing'
  end
  get '/cart', to: 'carts#show', as: 'current_user_cart'

  # get '/carts/:id/add-listing/:', to: 'carts#add_listing', as: 'add_cart_listing'
  # get '/cart/:id/remove-listing', to: 'carts#remove_listing', as: 'remove_cart_listing'

  resources :listings, except: [:new, :create]
  resources :parts, except: [:index] do
    resources :listings, only: [:new, :create]
    # get '/listing', to: 'listings#show_listing'
  end


  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
