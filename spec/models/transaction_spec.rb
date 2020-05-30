require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe Transaction do
    describe '#create' do

      context 'can save' do

        it '揃っていれば登録できる' do
          user = create(:user)
          product = create(:product)
          transaction = build(:transaction, user_id: user.id, product_id: product.id)
          expect(transaction).to be_valid
        end

      end

      context 'can not save' do

        it 'nameがないと登録できない' do
          transaction = build(:transaction, name: "")
          transaction.valid?
          expect(transaction.errors[:name]).to include("を入力してください")
        end

        it 'priceがないと登録できない' do
          transaction = build(:transaction, price: "")
          transaction.valid?
          expect(transaction.errors[:price]).to include("を入力してください")
        end

      end

    end
  end
end
