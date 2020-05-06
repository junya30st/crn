class Shop < ApplicationRecord
  belongs_to :customer
  has_many :products, dependent: :delete_all
  
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :location, presence: true
end
