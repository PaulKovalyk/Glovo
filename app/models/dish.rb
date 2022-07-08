# frozen_string_literal: true

class Dish < ApplicationRecord
    belongs_to :restaurant
    enum category: { no_category: 0, main_dish: 1, pizza: 2, dessert: 3, soup: 4 }

    has_many :line_items

   before_destroy :ensure_not_refrenced_by_any_line_item

  private

    def ensure_not_refrenced_by_any_line_item
      if line_items.empty?
        return true
      else
        flash[:danger] = 'this line_item is using on the order!'
      end
    end
end
