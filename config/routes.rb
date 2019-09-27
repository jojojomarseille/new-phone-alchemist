Rails.application.routes.draw do


  ActiveAdmin.routes(self)
  resources :line_items
  resources :carts
  devise_for :users
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products
  #get 'products/new' => 'products#new'
  #post 'products/new' => 'products#create'

  #get 'products' => 'products#index'
  #post 'products' => 'products#create'

  #get 'products/:id' => 'products#show'
  #patch 'products/:id' => 'products#update'

  #delete 'products/:id' => 'products#destroy'
  get 'productsby/:id' => 'products#index_by_categorie'

  get 'zones' => 'zones#index'
  get 'zones/new'
  post 'zones' => 'zones#create'
  get 'zones/:id' => 'zones#show'
  patch 'zones/:id' => 'zones#update'
  delete 'zones/:id' => 'zones#destroy'

  #get 'categories' => 'categories#index'
  #get 'categories/new'
  #post 'categories/new' => 'categories#create'
  #post 'categories' => 'categories#create'
  #get 'categories/:id' => 'categories#show'
  #patch 'categories/:id' => 'categories#update'
  #delete 'categories/:id' => 'categories#destroy'

  resources :categories


end
