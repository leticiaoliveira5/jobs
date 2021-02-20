class ApplicationController < ActionController::Base


    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :surname, :email, :password, :role)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :surname, :email, :password, :current_password)}
    end

    def after_sign_up_path_for(resource)
        company_path(@employee.company_id)
    end
        
end
