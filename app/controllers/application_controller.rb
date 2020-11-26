class ApplicationController < ActionController::Base
  
 include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

def record_not_found
  redirect_to root_path
end 
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:firstname, :lastname, :age, :email, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :firstname,
        :lastname,
        :age,
        :email,
        :password,
        :current_password
      )
    end
  end
end
