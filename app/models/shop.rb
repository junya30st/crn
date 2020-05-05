class Shop < ApplicationRecord
  belongs_to :customer
  has_many :products
  
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :location, presence: true
end
