class CardsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!

  def new
    card = Card.where(user_id: current_user.id).first
    redirect_to root_path, notice: 'カードは登録済みです' if card.present?
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたらPay.jpに顧客情報を登録
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )

      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card)
        
      if @card.save
        redirect_to root_path, notice: 'カードの登録に成功しました'
      else
        flash.now[alert] = 'カード情報を登録できませんでした'
        render "new"
      end
    end
  end

  def show
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @exp_month = @default_card_information.exp_month.to_s
      @exp_year = @default_card_information.exp_year.to_s.slice(2,3)
    end
  end

  def destroy
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      flash.now[alert] = 'カード情報がありません'
      render "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
      redirect_to action: "new",notice: 'カード情報を削除しました'
    end
  end

end
