class ApplicationController < ActionController::Base


    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :surname, :email, :password, :role, :cpf, :about_me)}
        
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :surname, :cpf, :about_me, :email, :password, :current_password)}
    end

    def after_sign_up_path_for(resource)
        if @employee
            company_path(@employee.company_id)
        elsif @candidate
            resume_path(@candidate.resume)
        end
    end
        
end
