# class RoleRouteConstraint
#   def initialize(&block)
#     @block = block || lambda { |user| true }
#   end

#   def matches?(request)
#     user = current_user(request)
#     user.present? && @block.call(user)
#   end

#   def current_user(request)
#     User.find_by_id(request.session[:user_id])
#   end
# end

  # class NewUserConstraint 
  #   def self.matches?(request) 
  #     request.query_parameters[user.role] == 'admin' 
  #   end 
  # end

Rails.application.routes.draw do
  resources :orders, :books, :authors, :genres, :users

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
  delete "shoping", to: "shopings#destroy"

  # get "/books/new", to: "books#new", constraints: { Current.user.present? && Current.user.role == "admin" }


  # authenticate :user, -> (u) { u.role.admin.present? } do
  #   get "/books/new", to: "books#new"
  # end


  # constraints RoleRouteConstraint.new { |user| user.has_role? :admin } do
  #   get "/books/new", to: "books#new"
  # end
  
  

end
