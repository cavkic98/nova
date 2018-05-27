class CustomersController < ApplicationController
  before_action :if_customer
  def show
    @customer = Customer.find(params[:id])
  end
  
  
  private
  
  def if_customer
    if customer_signed_in? 
    redirect_to root_path unless current_customer.id.to_s == params[:id]
    else
    redirect_to root_path
    end
    
  end
  
end