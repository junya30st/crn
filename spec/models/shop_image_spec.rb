require 'rails_helper'

RSpec.describe ShopImage, type: :model do
  # describe ShopImage do
  #   describe '#create' do
    
  #     context 'can save' do

  #       it '揃っていれば保存できる' do
  #         shop = build(:shop)
  #         shopImage = build(:shop_image, shop_id: shop.id)
  #         expect(shopImage).to be_valid
  #       end

  #     end

  #     context 'can not save' do

  #       it 'imageがないと保存できない' do
  #         shop_image = build(:shop_image, image = "")
  #         shop_image.valid?
  #         expect(shop_image.errors[:image]).to include("を入力してください")
  #       end

  #       it 'shop_idがないと保存できない' do
  #         shop_image = build(:shop_image, shop_id = "")
  #         shop_image.valid?
  #         expect(shop_image.errors[:shop_id]).to include("を入力してください")
  #       end

  #     end
  #   end
  # end
end
