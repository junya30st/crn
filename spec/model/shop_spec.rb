require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe Customer do
    describe '#create' do

      context 'can save' do
        it '全て揃っていれば登録できる' do
          shop = build(:shop)
          expect(shop).to be_valid
        end  

        it 'introduction,open_time,close_time,url,tel,imageがなくても登録できる' do
          shop = build(:shop, introduction: "", open_time: "", close_time: "", url: "", tel: "", image: "")
          expect(shop).to be_valid
        end        
      end

      context 'can not save' do
        it 'nameがないと登録できない' do
          shop = build(:shop, name: "")
          shop.valid?
          expect(shop.errors[:name]).to include("can't be blank")
        end

        it 'locationがないと登録できない' do
          shop = build(:shop, location: "")
          shop.valid?
          expect(shop.errors[:location]).to include("can't be blank")
        end
      end

    end
  end
end