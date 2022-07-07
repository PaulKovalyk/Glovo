# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :restaurant_tags, dependent: :destroy
  has_many :tags, through: :restaurant_tags
  has_many :dishes, dependent: :destroy
  validates :name, :description, :image_url, :address, presence: true
  validates :name, length: { minimum: 2 }
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png|svg)\Z/i,
    message: 'URL must be format of GIF, JPG, or PNG' # rubocop:disable Rails/I18nLocaleTexts: Move locale texts to the locale files in the config/locales directory.
  }
end
