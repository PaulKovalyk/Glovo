class AddUserIdToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :user_id, :integer, null: false
  end
end
