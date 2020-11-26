class ApplicationController < ActionController::Base
  # Chris: il va falloire créer un controlleur heritant du controller Devise, le brancher au partial, et 
  # incorporer l'aiguilleur. Je m'en occuperais. La bise
  

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


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
