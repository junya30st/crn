class Shop < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :menus, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :shop_images, dependent: :destroy
  accepts_nested_attributes_for :shop_images
  
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :location, presence: true
end
