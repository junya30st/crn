class Shop < ApplicationRecord
  belongs_to :customers
  has_many :products
  
  validates :name, presence: true
  validates :location, presence: true
end
