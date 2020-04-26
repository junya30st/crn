class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.create(shop_params)
    redirect_to new_user_path
  end

  def show
    # @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    shop = Shop.find(params[:id])
    if shop.id == current_user.id
      shop.update(shop_params)
      redirect_to shops_path
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    if shop.id == current_user.id
      shop.destroy(shop_params)
      redirect_to shops_path
    end
  end

  private

  def shop_params
    params.permit(:name, :introduction, :location, :open_time, :close_time, :url, :tel)
  end

end
