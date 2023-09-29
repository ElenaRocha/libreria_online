json.extract! user, :id, :name, :first_surname, :second_surname, :email, :password, :telephone, :address, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
