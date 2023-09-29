class CreateEditions < ActiveRecord::Migration[7.0]
  def change
    create_table :editions do |t|
      t.string :isbn
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
