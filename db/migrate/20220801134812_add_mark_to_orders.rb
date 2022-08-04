class AddMarkToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :mark, :integer, default: 0
  end
end
