json.extract! author, :id, :name, :first_surname, :second_surname, :birth_date, :nationality, :created_at, :updated_at
json.url author_url(author, format: :json)
