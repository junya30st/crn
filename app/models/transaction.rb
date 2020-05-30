class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :product
  
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :price, presence: true
end
