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
  get 'indexadmin' => 'products#indexadmin'
  post 'zones' => 'zones#create'
  get 'zones/:id' => 'zones#show'
  patch 'zones/:id' => 'zones#update'
  delete 'zones/:id' => 'zones#destroy'

  get 'callbackstarts' => 'callbackstarts#index'
  get 'callbackstarts/new'
  post 'callbackstarts' => 'callbackstarts#create'

  get 'callbackends' => 'callbackends#index'
  get 'callbackends/new'
  post 'callbackends' => 'callbackends#create'
  #get 'categories' => 'categories#index'
  #get 'categories/new'
  #post 'categories/new' => 'categories#create'
  #post 'categories' => 'categories#create'
  #get 'categories/:id' => 'categories#show'
  #patch 'categories/:id' => 'categories#update'
  #delete 'categories/:id' => 'categories#destroy'
  get 'home' => 'products#index'
  get 'CGU' => 'pages#CGU'
  get 'user' => 'pages#user'
  get 'Qui' => 'pages#Qui_sommes_nous'
  get 'zoneadmin' => 'pages#zoneadmin'
  get 'Userdashboard' => 'pages#Userdashboard'

  resources :categories

  resources :orders, only: [:show, :create, :index, :update] do
    resources :payments, only: :new
  end

  # patch 'orders/:id' => 'zones#update'

mount StripeEvent::Engine, at: '/stripe-webhooks'

mount Audiotel::Base => '/'


end
