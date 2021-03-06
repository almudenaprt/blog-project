class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!  # Para pedir al usuario que inicie sesión al entrar en la página de inicio
 
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])

    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end
end
