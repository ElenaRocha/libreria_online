class CategoriesController < ApplicationController
    
    # GET categories/genre/:genre
    def get_books_genre
        # @book = Book.where("genre_id = ?", params[:genre])

        # @book = Book.where("book.genres = ?", params[:genre])
        # @book = Book.where(book.genres.collect(&:definition).include?('params[:genre]'))
        # @book = Book.find_by_genres(params[:genre])
        #find_by_sql
        
    end

    # GET categories/search
    def get_books_search
        @books = @query.result(distinct: true)
    end
end
