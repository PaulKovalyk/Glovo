# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, :pay_type,presence: true

  def add_line_items_from_cart(cart)
   
  
   
    cart.line_items.each do |item|
      
        item.update(cart_id: nil)
        
        self.line_items << item
        
    end
  end
end
