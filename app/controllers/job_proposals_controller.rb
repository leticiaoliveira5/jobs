class JobProposalsController < ApplicationController
  before_action :authenticate_employee!, only: %i[create new]
  before_action :authenticate_candidate!, only: %i[show accept reject]
  before_action :set_job_proposal, except: %i[new create]

  def new
    @job_proposal = JobProposal.new(
      candidate: job_application.candidate,
      job_application:
    )
  end

  def create
    return unless job_application

    @job_proposal = JobProposal.new(job_proposal_params.merge(
                                      candidate: job_application.candidate,
                                      job_application:
                                    ))

    if @job_proposal.save
      JobProposalMailer.notify_proposal(@job_proposal.id).deliver_now
      redirect_to company_path(job_application.company), notice: t('.success')
    else
      render 'new'
    end
  end

  def show; end

  def accept
    @job_proposal.start_date_confirmation = params[:start_date_confirmation]
    @job_proposal.accepted!
    @job_proposal.check_number_of_positions
    redirect_to job_application_job_proposal_path(@job_proposal), notice: t('.success')
  end

  def reject
    @job_proposal.rejection_motive = params[:rejection_motive]
    @job_proposal.rejected!
    redirect_to job_application_job_proposal_path(@job_proposal), notice: t('.success')
  end

  private

  def set_job_proposal
    @job_proposal = JobProposal.find(params[:id])
  end

  def job_application
    @job_application ||= JobApplication.find(params[:job_application_id])
  end

  def job_proposal_params
    params.require(:job_proposal).permit(:message,
                                         :start_date,
                                         :salary_proposal,
                                         :job_application,
                                         :candidate,
                                         :job_opportunity)
  end
end
