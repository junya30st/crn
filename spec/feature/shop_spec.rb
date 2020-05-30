require 'rails_helper'

feature 'shop', type: :feature do

  let(:user) {create(:user)}
  let!(:category) {create(:category)}

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

  scenario '店舗作成' do
    visit new_shop_path
    fill_in '名前', with: 'test'
    fill_in '所在地', with: '東京都渋谷区神泉1234'
    select_time("13", "00", from: "ランチ開店時刻")
    select_time("13", "00", from: "ランチ閉店時刻")
    select_time("13", "00", from: "ディナー開店時刻")
    select_time("13", "00", from: "ディナー閉店時刻")
    select_time("13", "00", from: "ランチL.O.")
    select_time("13", "00", from: "ディナーL.O.")
    select category.name, from: 'カテゴリー'
    click_on '登録する'
    expect(page).to have_content '店舗を作成しました'
  end

  scenario '店舗情報を編集する' do
    time = Time.now
    shop = create(:shop,
      name: "test", location: "東京都渋谷区1234", category: category, 
      open_time: time, close_time: time,dinner_open: time,dinner_close: time,
      lunch_last: time,dinner_last: time, user_id: user.id)

    visit shop_path(shop)
    expect(current_path).to eq shop_path(shop)
    click_on '編集する'
    expect(page).to have_content '店舗編集'
    fill_in '名前', with: 'update'
    click_on '登録する'
    expect(page).to have_content '店舗情報を更新しました'
  end
end
