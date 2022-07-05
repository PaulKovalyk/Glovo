# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :restaurant_tags, dependent: :destroy
  has_many :restaurants, through: :restaurant_tags
end
