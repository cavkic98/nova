class ApplicationController < ActionController::Base
 protect_from_forgery with: :null_session
  
 before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, 
    :email, :phone_number, :country, :addres, :city])
    #in keys you list all the input you want to accept.
  end

end
