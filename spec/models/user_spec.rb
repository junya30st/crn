require 'rails_helper'

RSpec.describe User, type: :model do
  describe user do
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
          expect(user.errors[:name]).to include("can't be blank")
        end

        it 'emailがないと登録できない' do
          user = build(:user, email: "")
          user.valid?
          expect(user.errors[:email]).to include("can't be blank")
        end

        it 'passwordがないと登録できない' do
          user = build(:user, password: "")
          user.valid?
          expect(user.errors[:password]).to include("can't be blank")
        end

        it 'password_confirmationがないと登録できない' do
          user = build(:user, password_confirmation: "")
          user.valid?
          expect(user.errors[:password_confirmation]).to include("doesn't match Password")
        end

      end

    end
  end
end

