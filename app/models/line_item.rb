# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :dish
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  validates :cart_id, presence: true, on: :create

  def total_price
    dish.price * quantity
  end

  def line_items_price
    
    order_price = 0
    line_items.each do |item|
     
      if item.dish.restaurant.user_id == current_user.id
      order_price += item.total_price 
      end
    end
    order_price
   
  end
end
