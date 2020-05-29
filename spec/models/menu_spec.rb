require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe Menu do
    describe '#create' do

      context 'can save' do

        it '全て入力されていれば登録できる' do
          menu = build(:menu)
          expect(menu).to be_valid
        end

        it 'introductionがなくても登録できる' do
          menu = build(:menu, introduction: "")
          expect(menu).to be_valid
        end

      end

      context 'can not save' do

        it 'nameがないと登録できない' do
          menu = build(:menu, name: "")
          menu.valid?
          expect(menu.errors[:name]).to include("を入力してください")
        end

        it 'priceがないと登録できない' do
          menu = build(:menu, price: "")
          menu.valid?
          expect(menu.errors[:price]).to include("を入力してください")
        end

        # it 'priceが全角数字では登録できない' do
        #   menu = build(:menu, price: "１００")
        #   menu.valid?
        #   expect(menu.errors[:price]).to include("は半角数字で入力してください")
        # end
      end
    end
  end
end
