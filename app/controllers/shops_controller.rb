class ShopsController < ApplicationController
  protect_from_forgery except: :index

  def index
    @shop = Shop.where(params[:id])
  end

  def new
    # @shop = Shop.new
  end

  def create
    @shop = Shop.create(shop_params)
    redirect_to root_path
  end

  def show
    @shop = Shop.find(params[:id])
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

  def search
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def shop_params
    params.permit(:name, :introduction, :location, :open_time, :close_time, :url, :tel).merge(customer_id: current_customer.id)
  end

end
