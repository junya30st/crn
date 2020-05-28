class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :correct_owner, only: [:new, :create, :destroy]

  def index
    @products = Product.where(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(
      name: p_params[:name],
      introduction: p_params[:introduction],
      price: p_params[:price],
      limit: p_params[:limit],
      number: p_params[:number],
      image: p_params[:image],
      shop_id: @shop.id)

    if @product.save
      redirect_to root_path
    else
      render "new"
    end

  end

  def show
    @product = Product.find(params[:id])
    @shop = Shop.find_by(id: @product.shop_id)
  end

  def destroy
    @product.destroy
    redirect_to shop_path(@shop)
  end

  private

  def p_params
    params.require(:product).permit(:name, :introduction, :price, :limit, :number, :image, :shop_id)
  end

  def correct_owner
    @shop = Shop.find(params[:shop_id])
    unless @shop.user_id == current_user.id
      redirect_to root_path
    end
  end

end
