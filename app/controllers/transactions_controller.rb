class TransactionsController < ApplicationController
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
    today = Date.today.strftime("%Y-%m-%d")
    day = today.to_date

    # binding.pry

    @transaction = Transaction.new(
      name: @product.name,
      price: @product.price,
      introduction: @product.introduction,
      product_id: @product.id,
      user_id: current_user.id
    )
    @transaction.save
    @transaction.period = @transaction.created_at

    if @product.limit == 1
      @transaction.period = 1.months.from_now
    elsif @product.limit == 2
      @transaction.period = 3.months.from_now
    elsif @product.limit == 3
      @transaction.period = 6.months.from_now
    elsif @product.limit == 4
      @transaction.period = 1.years.from_now
    else
      @transaction.period = nil
    end
    # binding.pry
    if @transaction.save
      number = @product.number.to_i - 1
      @product.number = number
      @product.save
      redirect_to root_path
    else
      render action: "create"
    end

  end

  def show
    @transaction = Transaction.find_by(params[:id])
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
