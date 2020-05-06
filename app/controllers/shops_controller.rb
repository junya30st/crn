class ShopsController < ApplicationController
  protect_from_forgery except: :index

  def index
    @shop = Shop.all
  end

  def new
    @shop = Shop.new
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
    @shop = Shop.find(params[:id])
    if @shop.customer_id == current_customer.id
      @shop.update(shop_params)
      redirect_to shops_path
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end

  def search
    return nil if params[:keyword] == ""
    @shops = Shop.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def shop_params
    params.permit(:name, :introduction, :image, :location, :open_time, :close_time, :url, :tel).merge(customer_id: current_customer.id)
  end

end
