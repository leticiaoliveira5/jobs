class JobProposalsController < ApplicationController

    before_action :authenticate_employee!, only: %i[:create, :new]
    before_action :authenticate_candidate!, only: %i[:show]

    def new
        @job_application = JobApplication.find(params[:job_application_id])
        @job_proposal = JobProposal.new
        @job_proposals = JobProposal.all
    end

    def create
        @job_application = JobApplication.find(params[:job_application_id])
        job_proposal_params = params.require(:job_proposal).permit(:message, 
                                                        :start_date, 
                                                        :salary_proposal,
                                                        :job_application,
                                                        :candidate)
        @job_proposal = JobProposal.new(job_proposal_params)
        @job_proposal.job_application = @job_application
        @job_proposal.candidate = @job_application.candidate
        if @job_proposal.save
            redirect_to company_path(@job_application.job_opportunity.company), notice: t('.success')
        else
            render 'new'
        end
    end

    def show 
        @job_proposal = JobProposal.find(params[:id])
    end

end