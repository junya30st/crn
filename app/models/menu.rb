class Menu < ApplicationRecord
  belongs_to :shop

  validates :name, presence: true
  validates :price, presence: true, format: {with: /\A[0-9]+\z/}
end
