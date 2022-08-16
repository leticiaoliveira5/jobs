class JobApplicationsController < ApplicationController
  before_action :authenticate_candidate!, only: %i[destroy]
  before_action :authenticate_employee!, only: %i[decline]

  def show
    @job_application = JobApplication.find(params[:id])
    @candidate = @job_application.candidate
  end

  def destroy
    @job_application = JobApplication.find(params[:id])
    @candidate = @job_application.candidate
    @job_application.destroy
    redirect_to candidates_path(@candidate), notice: t('.success')
  end

  def decline
    @job_application = JobApplication.find(params[:id])
    @job_application.rejection_motive = params[:rejection_motive]
    @job_application.declined!
    redirect_to company_path(@job_application.company),
                notice: t('.success', candidate: @job_application.candidate.firstname)
  end
end
