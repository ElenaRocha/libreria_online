class CategoriesController < ApplicationController
    
    # GET categories/genre
    def get_books_genre
        @book = Book.where("genre_id = ?", params[:genre])
    end

    # GET categories/author
    def get_books_search
        @books = @query.result(distinct: true)
    end
end
