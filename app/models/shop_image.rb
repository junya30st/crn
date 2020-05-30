class ShopImage < ApplicationRecord
  belongs_to :shop

  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
