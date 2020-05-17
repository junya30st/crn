class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_product, only:[:new, :create]
  
  def new
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    # binding.pry
    Payjp::Charge.create(
      amount: @product.price, # 決済する値段
      card: params['payjp-token'],
      currency: 'jpy'
    )

    @transaction = Transaction.new(
      name: @product.name,
      price: @product.price,
      period: params[:period],
      introduction: @product.introduction,
      product_id: @product.id,
      user_id: current_user.id
    )
    # binding.pry
    @transaction.save

    if @product.limit == "１ヶ月"
      @transaction.period = 1.months.from_now
    elsif @product.limit == "３ヶ月"
      @transaction.period = 3.months.from_now
    elsif @product.limit == "６ヶ月"
      @transaction.period = 6.months.from_now
    elsif @product.limit == "１年"
      @transaction.period = 1.years.from_now
    else
      @transaction.period = nil
    end

    # binding.pry

    if @transaction.save
      number = @product.number.to_i - 1
      @product.number = number
      @product.save
      redirect_to transaction_path(@transaction)
    else
      render action: "create"
    end

  end

  def show
    @transaction = Transaction.find(params[:id])
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
