class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true, default: Current.user.id
      t.string :state, default: "activo"

      t.timestamps
    end
  end
end
