class HomeController < ApplicationController
  def index
    if candidate_signed_in?
      redirect_to candidates_path(current_candidate)
    elsif employee_signed_in?
      redirect_to company_path(current_employee.company)
    else
      @job_opportunities = JobOpportunity.all
    end
  end
end
