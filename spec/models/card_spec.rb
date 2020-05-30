require 'rails_helper'

RSpec.describe Card, type: :model do
  describe Card do
    describe '#create' do

      context 'can save' do
        it '揃っていれば登録できる' do
          user = create(:user)
          card = build(:card, user_id: user.id)
          expect(card).to be_valid
        end        
      end

      context 'can not save' do

        it 'user_idがないと登録できない' do
          card = build(:card, user_id: "")
          card.valid?
          expect(card.errors[:user_id]).to include("を入力してください")
        end

        it 'customer_idがないと登録できない' do
          card = build(:card, customer_id: "")
          card.valid?
          expect(card.errors[:customer_id]).to include("を入力してください")
        end

        it 'card_idがないと登録できない' do
          card = build(:card, card_id: "")
          card.valid?
          expect(card.errors[:card_id]).to include("を入力してください")
        end
      end
    end
  end
end
