class CategoriesController < ApplicationController
    
    # GET categories/genre
    def set_books_genre
        @book = Book.find(params[:genre])
    end

    # GET categories/author
    def set_books_author
        @book = Book.find(params[:author])
    end
end
