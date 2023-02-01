class JobApplicationsController < ApplicationController
  before_action :set_job_application, :set_candidate
  before_action :authenticate_candidate!, only: %i[destroy]
  before_action :authenticate_employee!, only: %i[decline]

  def show; end

  def destroy
    @job_application.destroy
    redirect_to '/candidate/dashboard', notice: t('.success')
  end

  def decline
    @job_application.rejection_motive = params[:rejection_motive]
    @job_application.declined!
    redirect_to company_path(@job_application.company),
                notice: t('.success', candidate: @candidate.firstname)
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def set_candidate
    @candidate = @job_application.candidate
  end
end
