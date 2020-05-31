require 'rails_helper'

feature 'category', type: :feature do

  scenario 'ジャンル作成' do
    user = create(:user, name: "spec", email: "specxxx@gmail.com", password: "12345678", password_confirmation: "12345678", admin: 1)
    visit new_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    fill_in 'パスワード確認', with: user.password_confirmation
    within '.button-register' do
      click_on 'ログイン'
    end
    click_on 'カテゴリを作成'
    fill_in 'ジャンル名', with: 'test'
    click_on '登録する'
    expect(page).to have_content 'ジャンルを作成しました'
  end
end