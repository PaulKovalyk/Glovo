# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :dish
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  validates :cart_id, presence: true, on: :create

  def total_price
    dish.price * quantity
  end
end
