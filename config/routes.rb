Rails.application.routes.draw do
  resources :orders, :editions, :books, :authors, :genres, :users
  # resources :editions
  # resources :books
  # resources :authors
  # resources :genres
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #métodos GET, POST, PATCH, PUT y DELETE

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "books#index"

  get "sessions", to: "sessions#sign"
  post "sessions", to: "sessions#enter"
end
