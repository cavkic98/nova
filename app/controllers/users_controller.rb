class UsersController < ApplicationController
  before_action  :if_customer
  
  def show
    @user = User.find(params[:id])
   
  end
  
  private
  
  def if_customer
    if user_signed_in? 
    redirect_to root_path unless current_user.id.to_s == params[:id]
    else
    redirect_to root_path
    end
    
  end
  
  
end