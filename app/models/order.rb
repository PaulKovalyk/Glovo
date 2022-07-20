# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, :pay_type, presence: true

  def add_line_items_from_cart(cart)
    order_price = 0
    cart.line_items.each do |item|
      item.update(cart_id: nil)

      line_items << item

      order_price += item.total_price
    end
    update(order_price: order_price)
  end

  def ordered_recently?
    created_at > 5.minutes.ago
  end
end
