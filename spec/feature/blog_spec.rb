require 'rails_helper'

feature 'blog', type: :feature do

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
  
  scenario 'ブログを作成する' do
    visit shop_path(@shop)
    expect(current_path).to eq shop_path(@shop)
    click_on '投稿する'
    expect(page).to have_content 'ブログ新規投稿'
    fill_in 'タイトル', with: 'test'
    fill_in '本文', with: 'test'
    click_on '投稿する'
    expect(page).to have_content '投稿に成功しました'
  end

  scenario 'ブログを編集・削除' do
    # 編集
    blog = create(:blog, title: 'test', content: "test", shop_id:@shop.id)
    visit shop_path(@shop)
    expect(current_path).to eq shop_path(@shop)
    click_on "#{blog.title}"
    expect(current_path).to eq blog_path(blog)
    click_on '編集'
    expect(page).to have_content 'ブログ編集'
    fill_in 'タイトル', with: 'spec'
    click_on '投稿する'
    expect(page).to have_content '情報を更新しました'

    # 削除
    click_on '削除'
    expect(page).to have_content 'ブログを削除しました'
  end
end