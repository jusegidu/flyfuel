Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'stations', to: 'gas_stations#index'
  get 'stations/:id', to: 'gas_stations#show'
  resources: stations, only [index, show]
end
