json.extract! book, :id, :title, :author_id, :genre_id, :publication_date, :n_pages, :synopsis, :price, :created_at, :updated_at
json.url book_url(book, format: :json)