# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    if @employee.company.employees.count == 1
      edit_company_path(@employee.company)
    else
      company_path(@employee.company)
    end
  end
end
