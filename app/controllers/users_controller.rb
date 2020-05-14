class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @trnsactions = @user.transactions
  end

end
