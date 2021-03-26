# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    if current_employee.company.employees.count == 1
      edit_company_path(current_employee.company)
    else
      company_path(current_employee.company)
    end
  end
end
