require 'rails_helper'

RSpec.describe Product, type: :model do
  describe Product do
    describe '#create' do

      context 'can save' do

        it '揃っていれば登録できる' do
          product = build(:product)
          expect(product).to be_valid
        end

        it 'numberがなくても登録できる' do
          product = build(:product, number: "")
          expect(product).to be_valid
        end

      end

      context 'can not save' do

        it 'nameがないと登録できない' do
          product = build(:product, name: "")
          product.valid?
          expect(product.errors[:name]).to include("を入力してください")
        end

        it 'limitがないと登録できない' do
          product = build(:product, limit: "")
          product.valid?
          expect(product.errors[:limit]).to include("を入力してください")
        end

        it 'introductionがないと登録できない' do
          product = build(:product, introduction: "")
          product.valid?
          expect(product.errors[:introduction]).to include("を入力してください")
        end

        it 'priceがないと登録できない' do
          product = build(:product, price: "")
          product.valid?
          expect(product.errors[:price]).to include("を入力してください")
        end

      end

    end
  end
end
