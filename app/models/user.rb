# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 3, maximum: 40 }
  has_many :restaurants, dependent: :destroy
  has_many :orders, dependent: :destroy
end
