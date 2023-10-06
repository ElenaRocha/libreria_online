class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :image
      t.string :title
      t.references :author, null: false, foreign_key: true
      t.date :publication_date
      t.integer :n_pages
      t.text :synopsis
      t.decimal :price

      t.timestamps
    end
  end
end
