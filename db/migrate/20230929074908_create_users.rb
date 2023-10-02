class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :first_surname
      t.string :second_surname
      t.string :email
      t.string :password
      t.integer :telephone
      t.string :address
      t.string :role,  default: "client"

      t.timestamps
    end
  end
end
