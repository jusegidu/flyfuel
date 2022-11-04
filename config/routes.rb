Rails.application.routes.draw do
  get 'payments/new'
  get 'payments/create'
  get 'payments/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :gas_stations do
    resources :gas_station_products, only: :create
  end
  resources :gas_station_products, except: :create

  resources :purchases

  resources :payments
end
