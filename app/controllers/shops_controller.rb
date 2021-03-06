class ShopsController < ApplicationController
  protect_from_forgery except: :index
  before_action :authenticate_user!, only:[:new, :create]
  before_action :set_shops,only: [:show, :edit, :update, :destroy, :blog, :menu]

  def top
  end

  def index
    @shop = Shop.includes(:user).order("id DESC").page(params[:page]).without_count.per(6)
    @category = Category.all
  end

  def new
    @shop = Shop.new
    5.times {@shop.shop_images.build}
    @category = Category.all
  end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      redirect_to shop_path(@shop), notice: '店舗を作成しました'
    else
      flash.now[:alert] = '作成に失敗しました'
      render "new"
    end
  end

  def show
    @blog = Blog.where(shop_id: @shop.id).order("id DESC")
  end

  def edit
  end

  def update
    if @shop.user_id == current_user.id
      @shop.update(shop_params)
      redirect_to shop_path(@shop), notice: '店舗情報を更新しました'
    end
  end

  def destroy
    if @shop.user_id == current_user.id
      @shop.destroy
      redirect_to shops_path
    end
  end

  def blog
  end

  def menu
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
    params.require(:shop).permit(
      :name, :introduction, :image,
      :location, :open_time, :close_time,
      :url, :tel, :category_id,
      :lunch_price, :dinner_price,
      :dinner_open, :dinner_close,
      :lunch_last, :dinner_last,
      shop_images_attributes: [:image])
  end

end
