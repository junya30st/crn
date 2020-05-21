class Blog < ApplicationRecord
  belongs_to :shop

  mount_uploader :image, ImageUploader
end
