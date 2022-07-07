# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :restaurant
  enum category: { no_category: 0, main_dish: 1, pizza: 2, dessert: 3, soup: 4 }
end
