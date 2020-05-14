class TransactionsController < ApplicationController
  before_action :set_product, only:[:new]
  
  def new
    @product = Product.find(params[:product_id])
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end
  
end
