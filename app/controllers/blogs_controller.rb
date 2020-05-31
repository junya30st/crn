class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_shop, only:[:new, :create]
  before_action :correct_owner, only: [:new, :create, :destroy]

  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(
      title: blog_params[:title],
      content: blog_params[:content],
      image: blog_params[:image],
      shop_id: @shop.id)
      
    if @blog.save
      redirect_to blog_path(@blog), notice: '投稿に成功しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render "new"
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @shop = Shop.find_by(id: @blog.shop_id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    shops = current_user.shops
    if shops.include?(@blog.shop)
      @blog.update(blog_params) 
      redirect_to blog_path(@blog), notice: '情報を更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render "edit"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    shops = current_user.shops
    if shops.include?(@blog.shop)
      @blog.destroy
      redirect_to shop_path(@blog.shop), notice: '削除に成功しました'
    else
      flash.now[:alert] = '削除に失敗しました'
      render "show"
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :shop_id)
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
