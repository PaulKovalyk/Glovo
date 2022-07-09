class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def up

    Cart.all.each do |cart|

      sums = cart.line_items.group(:dish_id).sum(:quantity)

      sums.each do |dish_id, quantity|
        if quantity>1

          cart.line_items.where(dish_id: dish_id).delete.all

          item = cart.line_items.build(dish_id: dish_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
end
