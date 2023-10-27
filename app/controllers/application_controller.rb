class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  before_action :set_current_user
  before_action :set_query
  before_action :set_genres
  before_action :set_authors

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def set_query
        @query = Book.ransack(params[:q])
    end

    def set_genres
        @genres = Genre.all
    end

    def set_authors
        @authors = Author.all
    end
end
