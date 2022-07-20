class RemoveOrderPriceFromTableOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :order_price, :decimal
  end
end
