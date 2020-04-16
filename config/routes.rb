Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/signout", to: "sessions#destroy"

  resources :transactions
  resources :carts

  resources :listings, except: [:new, :create]
  resources :parts do
    resources :listings, only: [:new, :create]
    get '/listing', to: 'listings#show_listing'
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
