class JobProposalsController < ApplicationController

    before_action :authenticate_employee!, only: %i[:create, :new]
    before_action :authenticate_candidate!, only: %i[:show, :accept, :reject]

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
                                                        :candidate,
                                                        :job_opportunity)
        @job_proposal = JobProposal.new(job_proposal_params)
        @job_proposal.job_application = @job_application
        @job_proposal.candidate = @job_application.candidate
        @job_proposal.company = current_employee.company
        @job_proposal.job_opportunity = @job_application.job_opportunity
        if @job_proposal.save
            redirect_to company_path(@job_application.job_opportunity.company), notice: t('.success')
        else
            render 'new'
        end
    end

    def show 
        @job_proposal = JobProposal.find(params[:id])
    end

    def accept
        @job_proposal = JobProposal.find(params[:id])
        @job_proposal.start_date_confirmation = params[:start_date_confirmation]
        @job_proposal.accepted!
        @job_proposal.check_number_of_positions
        redirect_to job_application_job_proposal_path(@job_proposal), notice: t(".success")
    end

    def reject
        @job_proposal = JobProposal.find(params[:id])        
        @job_proposal.rejection_motive = params[:rejection_motive]
        @job_proposal.rejected!
        redirect_to job_application_job_proposal_path(@job_proposal), notice: t(".success")
    end

end