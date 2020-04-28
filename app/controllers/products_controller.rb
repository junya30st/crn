class ProductsController < ApplicationController
  before_action :set_shop, only: [:new, :create]

  def index
    @product = Product.find_by(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @product = Product.new(name: p_params[:name], introduction: p_params[:introduction], price: p_params[:price], limit: p_params[:limit], shop_id: @shop.id)
    @product.save
    redirect_to root_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  private

  def p_params
    params.require(:product).permit(:name, :introduction, :price, :limit, :shop_id)
  end
  
  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
