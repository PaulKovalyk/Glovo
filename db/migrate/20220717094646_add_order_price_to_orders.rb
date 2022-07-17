class AddOrderPriceToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_price, :decimal , :default => 0
    #Ex:- :default =>''
  end
end
