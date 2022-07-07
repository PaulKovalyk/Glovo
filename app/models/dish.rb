class Dish < ApplicationRecord
  belongs_to :restaurant
  enum :status, {main_dish: 'Main Dish',pizza:'Pizza' ,dessert: 'Dessert', soup: 'Soup'}

  
  Dish.where(status: :soup)
  Dish.where.not(status: :soup)
  

  
end
