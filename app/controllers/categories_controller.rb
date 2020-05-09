class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end  

end
