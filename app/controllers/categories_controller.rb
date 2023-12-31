class CategoriesController < ApplicationController

    # GET categories/genre/:genre
    def get_books_genre
        @pagy, @books = pagy_array(Book.find_by_sql("SELECT * FROM books 
            INNER JOIN books_genres 
            ON books.id = books_genres.book_id 
            WHERE books_genres.genre_id = #{params[:genre]};"))
        # @books = ActiveRecord::Base.connection.exec_query("SELECT * FROM books 
        #     INNER JOIN books_genres 
        #     ON books.id = books_genres.book_id 
        #     WHERE books_genres.genre_id = #{params[:genre]};")
    end

    # GET categories/search
    def get_books_search
        @pagy, @books = pagy(@query.result(distinct: true))
    end

end
