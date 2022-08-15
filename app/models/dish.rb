# frozen_string_literal: true

class Dish < ApplicationRecord
  mount_uploader :image_dish, ImageDishUploader
  belongs_to :restaurant
  has_many :line_items, dependent: :destroy
  validates :name, :price, :weight, :category, presence: true
  enum category: { no_category: 0, main_dish: 1, pizza: 2, dessert: 3, soup: 4 }

  before_destroy :ensure_not_refrenced_by_any_line_item

  private

  def ensure_not_refrenced_by_any_line_item
    if line_items.empty?
      true
    else
      flash[:danger] = 'this line_item is using on the order!'
    end
  end
end
