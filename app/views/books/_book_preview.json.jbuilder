json.extract! book, :id, :image, :title, :author_id, :price, :created_at, :updated_at
json.url book_url(book, format: :json)
