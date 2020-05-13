class Product < ApplicationRecord
  
belongs_to :shop, dependent: :destroy

validates :name, presence: true
validates :introduction, presence: true
validates :price, presence: true

enum limit:{
  特になし:0,
  １ヶ月:1,
  ３ヶ月:2,
  ６ヶ月:3,
  １年:4,
},_prefix: true

end
