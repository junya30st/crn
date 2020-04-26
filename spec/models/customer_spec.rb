require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe Customer do
    describe '#create' do

      context 'can save' do
        it 'image,introductionがなくても登録できる' do
          customer = build(:customer, image: "", introduction: "")
          expect(customer).to be_valid
        end        
      end

      context 'can not save' do

        it 'nameがないと登録できない' do
          customer = build(:customer, name: "")
          customer.valid?
          expect(customer.errors[:name]).to include("can't be blank")
        end

        it 'emailがないと登録できない' do
          customer = build(:customer, email: "")
          customer.valid?
          expect(customer.errors[:email]).to include("can't be blank")
        end

        it 'passwordがないと登録できない' do
          customer = build(:customer, password: "")
          customer.valid?
          expect(customer.errors[:password]).to include("can't be blank")
        end

        it 'password_confirmationがないと登録できない' do
          customer = build(:customer, password_confirmation: "")
          customer.valid?
          expect(customer.errors[:password_confirmation]).to include("doesn't match Password")
        end

      end

    end
  end
end

