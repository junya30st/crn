require 'rails_helper'

feature 'blog', type: :feature do

  let(:user) {create(:user)}
  
  background do
    
    visit new_user_registration_path
    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    fill_in 'パスワード確認', with: user.password_confirmation
    within '.button-register' do
      click_on 'ログイン'
    end

  end

  scenario 'クレジットカード新規登録' do
    # visit root_path
    # click_on 'マイページ'
    # click_on 'カード情報登録'
    # allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
    # click_on '登録する'
    # expect(page).to have_content 'カードの登録に成功しました'
  end

end