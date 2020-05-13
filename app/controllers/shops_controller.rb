class ShopsController < ApplicationController
  protect_from_forgery except: :index
  before_action :set_shops,only: [:show, :edit, :update, :destroy]

  def index
    @shop = Shop.includes(:user).order("id DESC")
    @category = Category.all
  end

  def new
    @shop = Shop.new
    6.times {@shop.shop_images.build}
    @category = Category.all
  end

  def create
    @shop = current_user.shops.build(shop_params)
    @shop.save
    redirect_to root_path
  end

  def show
    # @shop = Shop.find(params[:id])

  end

  def edit
    # @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.user_id == current_user.id
      @shop.update(shop_params)
      redirect_to shops_path
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end

  def search
    return nil if params[:keyword] == ""
    @shops = Shop.where('name LIKE ? OR location LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%").limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def set_shops
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :introduction, :image, :location, :open_time, :close_time, :url, :tel, :category_id,
    shop_images_attributes: [:image])
  end

end
