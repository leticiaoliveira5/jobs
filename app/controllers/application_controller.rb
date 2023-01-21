class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:firstname, :surname, :email, :password, :role, :document, :about_me, :address)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:firstname, :surname, :document, :about_me, :website,
               :address, :email, :password, :current_password, :avatar)
    end
  end
end
