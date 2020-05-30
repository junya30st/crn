require 'rails_helper'

feature 'product', type: :feature do

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
      lunch_last: time,dinner_last: time, user_id: user.id)

  end

  scenario 'プロダクトを作成する' do

    visit shop_path(@shop)
    expect(current_path).to eq shop_path(@shop)
    click_on 'プロダクトを作成する'
    expect(page).to have_content 'プロダクト作成'
    fill_in '名前', with: 'test'
    fill_in '価格', with: 1000
    select '１ヶ月', from: '期限' 
    fill_in '個数', with: 10
    fill_in '商品説明', with: 'testです'
    click_on '登録する'
    expect(page).to have_content 'プロダクトを作成しました'
  end
  
  # 現状編集機能なし
  # scenario 'プロダクト編集' do
  #   product = create(:product, name: 'test', price: 1000, limit: 1, introduction: 'test', shop_id:@shop.id)
  #   visit shop_path(@shop)
  #   expect(current_path).to eq shop_path(@shop)
  #   click_on "#{product.name}"
  #   expect(current_path).to eq product_path(product)
  #   fill_in '名前', with: 'spec'
  #   click_on '登録する'
  #   expect(page).to have_content 'プロダクト情報を更新しました'
  # end

end
