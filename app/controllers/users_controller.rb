class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:show]

  def show
    @user = User.find(params[:id])
    @card = Card.find_by(user_id: @user.id)
  end

end
