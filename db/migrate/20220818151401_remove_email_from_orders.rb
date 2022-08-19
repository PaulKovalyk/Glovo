class RemoveEmailFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :email, :string
  end
end
