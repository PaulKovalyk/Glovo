# frozen_string_literal: true

class RestaurantTag < ApplicationRecord
  belongs_to :restaurant
  belongs_to :tag
end
