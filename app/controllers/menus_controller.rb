class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_owner, only: [:new, :create,]


  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(name: menu_params[:name], introduction: menu_params[:introduction], price: menu_params[:price], shop_id: @shop.id)
    if @menu.save
      redirect_to shop_path(@shop.id), notice: 'メニューを作成しました'
    else
      flash.now[:alert] = '作成に失敗しました'
      render "new"
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    shops = current_user.shops
    if shops.include?(@menu.shop) 
      @menu.update(menu_params)
      redirect_to menu_shop_path(@menu.shop), notice: 'メニューを更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render "edit"
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    shops = current_user.shops
    if shops.include?(@menu.shop)
      @menu.destroy
      redirect_to menu_shop_path(@menu.shop), notice: '指定のメニューを削除しました'
    else
      flash.now[:alert] = '削除に失敗しました'
      render edit
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :introduction, :price, :shop_id)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def correct_owner
    @shop = Shop.find(params[:shop_id])
    unless @shop.user_id == current_user.id
      redirect_to root_path, notice: '店舗オーナー以外は操作できません'
    end
  end

end
