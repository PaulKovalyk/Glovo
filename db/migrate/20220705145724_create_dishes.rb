class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.integer :weight
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
