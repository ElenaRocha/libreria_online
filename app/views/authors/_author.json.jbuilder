json.extract! author, :id, :name, :birth_date, :nationality, :created_at, :updated_at
json.url author_url(author, format: :json)
