class CategoriesController < ApplicationController
    # before_action :clear_search, :only => [:get_books_search]

    # GET categories/genre/:genre
    def get_books_genre
        @books = Book.find_by_sql("SELECT * FROM books 
            INNER JOIN books_genres 
            ON books.id = books_genres.book_id 
            WHERE books_genres.genre_id = #{params[:genre]};")
    end

    # GET categories/search
    def get_books_search
        # @query = Book.ransack(params[:q])
        @books = @query.result(distinct: true)
        # puts "la query: #{@query} y el inspect: #{@query.inspect} y cuales son los params? #{params}"
        # params.delete("q")
        
        # respond_to do |format|
        #     format.html
        #     format.json {render json: @books}
        #     format.js
    end

    # def clear_search
    #     if params[:q]
    #         params.delete(:q)
            # if(!search_params.nil?)
            #     search_params.each do |key, param|
            #         search_params[key] = nil
            #     end
            # end
    #     end
    # end

end
