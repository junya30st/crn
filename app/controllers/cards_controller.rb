class CardsController < ApplicationController
  require 'payjp'

  def new
    card = Card.where(user_id: current_user.id).first
    redirect_to root_path if card.present?
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        email: current_user.email,
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: current_user.id} # 無くてもOK。
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card)
        
      if @card.save
        redirect_to root_path
      else
        redirect_to action: "create"
      end
    end
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

    def set_params
    end
end
