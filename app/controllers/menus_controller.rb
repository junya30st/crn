class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: [:new, :create]

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(name: menu_params[:name], introduction: menu_params[:introduction], price: menu_params[:price], shop_id: @shop.id)
    if @menu.save
      redirect_to shop_path(@shop.id)
    else
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

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def menu_params
    params.require(:menu).permit(:name, :introduction, :price, :shop_id)
  end

end
