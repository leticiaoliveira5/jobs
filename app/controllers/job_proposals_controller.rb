class JobProposalsController < ApplicationController

    before_action :authenticate_employee!, only: %i[:create, :new]
    before_action :authenticate_candidate!, only: %i[:show]

    def new
        @job_application = JobApplication.find(params[:job_application_id])
        @job_proposal = JobProposal.new
        @job_proposals = JobProposal.all
    end

    def create
        job_proposal_params = params.require(:job_proposal).permit(:message, 
                                                        :start_date, 
                                                        :salary_proposal)
        @job_proposal = JobProposal.new(job_proposal_params)
    end

    def show 
        @job_proposal = JobProposal.find(params[:id])
    end

end