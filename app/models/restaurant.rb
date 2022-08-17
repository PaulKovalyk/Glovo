# frozen_string_literal: true

class Restaurant < ApplicationRecord
  mount_uploader :image, RestaurantUploader
  has_many :restaurant_tags, dependent: :destroy
  has_many :tags, through: :restaurant_tags
  has_many :dishes, dependent: :destroy
  belongs_to :user
  validates :name, :description, :address, presence: true
  validates :name, length: { minimum: 2 }

 
  scope :all_by_tags, lambda { |tags|
    restaurants = includes(:user)
    restaurants = if tags
      restaurants.joins(:tags).where(tags: tags)
                else
                  restaurants.includes(:restaurant_tags, :tags)
                end

                restaurants.order(created_at: :desc)
  }
end
