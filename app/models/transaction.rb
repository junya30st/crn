class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :name, presence: true
  validates :price, presence: true
  
  mount_uploader :image, ImageUploader

end
