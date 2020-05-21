class BlogsController < ApplicationController
  before_action :set_shop, only:[:new, :create]

  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(title: blog_params[:title], content: blog_params[:content], image: blog_params[:image], shop_id: @shop.id)
    # binding.pry
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :shop_id)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

end
