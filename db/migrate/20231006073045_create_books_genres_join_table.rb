class CreateBooksGenresJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :genres
  end
end
