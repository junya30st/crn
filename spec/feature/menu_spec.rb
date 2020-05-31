require 'rails_helper'

feature 'menu', type: :feature do

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

    time = Time.now
    @shop = create(:shop,
      name: "test", location: "東京都渋谷区1234", category: category, 
      open_time: time, close_time: time,dinner_open: time,dinner_close: time,
      lunch_last: time,dinner_last: time, user_id: user.id
    )
      
  end

  scenario 'メニューを作成する' do
    visit shop_path(@shop)
    expect(current_path).to eq shop_path(@shop)
    click_on 'メニューを作成する'
    expect(page).to have_content 'メニュー新規作成'
    fill_in 'メニュー名', with: 'test'
    fill_in 'メニュー詳細', with: 'test'
    fill_in '価格', with: 1000
    click_on '作成する'
    expect(page).to have_content 'メニューを作成しました'
  end

  scenario 'メニューを編集・削除' do
    # 編集
    menu = create(:menu, name: 'test', price: 1000, introduction: 'test', shop_id:@shop.id)
    visit shop_path(@shop)
    expect(current_path).to eq shop_path(@shop)
    click_on 'もっと見る'
    expect(current_path).to eq menu_shop_path(@shop)
    within '.edit-link' do
      click_on '編集'
    end
    expect(page).to have_content 'メニュー編集'
    fill_in 'メニュー名', with: 'spec'
    click_on '作成する'
    expect(page).to have_content 'メニュー情報を更新しました'

    # 削除
    within '.edit-link' do
      click_on '削除'
    end
    expect(page).to have_content '指定のメニューを削除しました'
  end

end