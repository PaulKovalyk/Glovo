class RemovePayTypeFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :pay_type, :string
  end
end
