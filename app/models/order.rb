# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true
  validates  :address,presence: true
  enum mark: { active: 0, completed: 1 }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.update(cart_id: nil)
      line_items << item
    end
  end

  def order_price
    order_price = 0
    line_items.each do |item|
      order_price += item.total_price
    end
    order_price
  end

  def order_price_owner(user)
    order_price = 0
    line_items.each do |item|
      order_price += item.total_price if item.dish.restaurant.user_id == user.id
    end
    order_price
  end

  def ordered_recently?
    created_at > 5.minutes.ago
  end
end
