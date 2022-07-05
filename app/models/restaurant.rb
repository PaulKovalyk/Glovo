class Restaurant < ApplicationRecord
    has_many :restaurant_tags, dependent: :destroy
    has_many :tags, through: :restaurant_tags
    has_many :dishes, dependent: :destroy
    validates :name, :description, :image_url, :address, presence: true
    validates :name, uniqueness: true, length: {minimum: 2}
    validates :image_url,  allow_blank: true, format: { 
        with: %r{\.(gif|jpg|png|svg)\Z}i,
        message: 'URL має вказувати на зображення формату GIF, JPG, чи PNG'}

end
