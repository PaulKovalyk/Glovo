class AddImageDishToDishes < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :image_dish, :string
  end
end
