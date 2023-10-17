Rails.application.routes.draw do
  resources :orders, :editions, :books, :authors, :genres, :users

  root to: "books#index"

  get "sessions", to: "sessions#sign"
  post "sessions", to: "sessions#enter"
  delete "sessions", to: "sessions#destroy"

  get "categories/genre/:genre", to: "categories#get_books_genre"
  get "categories/search/", to: "categories#get_books_search"

  get "shoping/:id", to: "shopings#index"
  post "shoping", to: "shopings#new"
  get "shoping", to: "shopings#show"
  post "shoping/finish/:id", to: "shopings#finish"
  delete "shoping/", to: "shopings#destroy"

end
