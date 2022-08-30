class HomeController < ApplicationController
  def index
    if candidate_signed_in?
      redirect_to candidates_path(current_candidate)
    elsif employee_signed_in?
      redirect_to company_path(current_employee.company)
    else
      @job_opportunities = JobOpportunity.first(6)
      @current_user = nil
    end
  end

  def self.random_background_image
    files = Dir.glob('app/assets/images/bg/*.jpg')
    file = files.sample
    "bg/#{File.basename(file)}"
  end
end
