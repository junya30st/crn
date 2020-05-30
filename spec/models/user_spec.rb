require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    describe '#create' do

      context 'can save' do
        it 'image,introductionがなくても登録できる' do
          user = build(:user, image: "", introduction: "")
          expect(user).to be_valid
        end        
      end

      context 'can not save' do

        it 'nameがないと登録できない' do
          user = build(:user, name: "")
          user.valid?
          expect(user.errors[:name]).to include("を入力してください")
        end

        it 'emailがないと登録できない' do
          user = build(:user, email: "")
          user.valid?
          expect(user.errors[:email]).to include("を入力してください")
        end

        it 'emailが重複すると登録できない' do
          user = create(:user)
          anotherUser = build(:user, email: user.email)
          anotherUser.valid?
          expect(anotherUser.errors[:email]).to include("はすでに存在します")
        end

        it 'passwordがないと登録できない' do
          user = build(:user, password: "")
          user.valid?
          expect(user.errors[:password]).to include("を入力してください")
        end

        it 'password_confirmationがないと登録できない' do
          user = build(:user, password_confirmation: "")
          user.valid?
          expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
        end

      end

    end
  end
end

