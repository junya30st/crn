class Product < ApplicationRecord
belongs_to :shop, dependent: :destroy

validates :name, presence: true
validates :introduction, presence: true
validates :price, presence: true
end
