require 'rails_helper'

feature 'user', type: :feature do

  let(:user) {create(:user)}
  scenario 'サインアップ' do
    visit new_user_registration_path
    fill_in '名前', with: 'test'
    fill_in 'メールアドレス', with: 'spec@gmail.com'
    fill_in 'パスワード', with: '12345678'
    fill_in 'パスワード確認', with: '12345678'
    click_on '登録する'
    expect(page).to have_content 'アカウント登録が完了しました'
  end

  scenario 'ログイン' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    fill_in 'パスワード確認', with: user.password_confirmation
    within '.button-register' do
      click_on 'ログイン'
    end
    expect(page).to have_content 'ログインしました'
  end
    
end