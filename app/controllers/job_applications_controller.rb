class JobApplicationsController < ApplicationController

    before_action :authenticate_candidate!

    def destroy
        @job_application = JobApplication.find(params[:id])
        @candidate = @job_application.candidate
        @job_application.destroy
        redirect_to candidates_path(@candidate), notice: t('.success')
    end
 
end