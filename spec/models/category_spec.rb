require 'rails_helper'

RSpec.describe Category, type: :model do
  describe Category do
    describe '#create' do

      context 'can save' do
        it 'nameがあれば保存できる' do
          category = build(:category)
          expect(category).to be_valid
        end
      end

      context 'can not save' do
        it 'nameがないと保存できない' do
          category = build(:category, name: "")
          category.valid?
          expect(category.errors[:name]).to include("を入力してください")
        end
      end

    end
  end
end
