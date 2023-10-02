class CategoriesController < ApplicationController
    
    # GET categories/genre
    def get_books_genre
        # @book = Book.find(params[:genre])
        @book = Book.where("genre = ?", params[:genre])
    end

    # GET categories/author
    def get_books_author
        @book = Book.where("title = ?", params[:author])
    end
end
