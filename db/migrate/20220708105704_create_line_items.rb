class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.decimal :price
      t.integer :quantity
      t.belongs_to :dishes, null: false, foreign_key: true
      t.belongs_to :carts, null: false, foreign_key: true
      t.belongs_to :orders, null: false, foreign_key: true

      t.timestamps
    end
  end
end
