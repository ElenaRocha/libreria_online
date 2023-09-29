class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :first_surname
      t.string :second_surname
      t.date :birth_date
      t.string :nationality

      t.timestamps
    end
  end
end
