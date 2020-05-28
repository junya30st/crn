class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_owner, only: [:new, :create, :destroy]


  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(name: menu_params[:name], introduction: menu_params[:introduction], price: menu_params[:price], shop_id: @shop.id)
    if @menu.save
      redirect_to shop_path(@shop.id), notice: 'メニューを作成しました。'
    else
      flash.now[:alert] = 'メニューの作成に失敗しました。'
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
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
      redirect_to root_path
    end
  end

end
