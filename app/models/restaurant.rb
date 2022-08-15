# frozen_string_literal: true

class Restaurant < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :restaurant_tags, dependent: :destroy
  has_many :tags, through: :restaurant_tags
  has_many :dishes, dependent: :destroy
  belongs_to :user
  validates :name, :description, :address, presence: true
  validates :name, length: { minimum: 2 }
end
