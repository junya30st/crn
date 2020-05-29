class Blog < ApplicationRecord
  belongs_to :shop

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :content, presence: true
end
