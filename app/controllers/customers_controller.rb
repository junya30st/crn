class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    # @shops = Shop.where(customer_id)
  end

end
