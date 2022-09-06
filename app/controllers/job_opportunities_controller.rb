class JobOpportunitiesController < ApplicationController
  before_action :authenticate_employee!, only: %i[create new edit]
  before_action :authenticate_candidate!, only: %i[create_job_application]

  def index
    @job_opportunities = JobOpportunity.active.last(30)
  end

  def new
    @job_opportunity = JobOpportunity.new
    @job_opportunities = JobOpportunity.all
  end

  def show
    @job_opportunity = JobOpportunity.find(params[:id])

    return unless employee_signed_in?

    @employee = current_employee.company == @job_opportunity.company
    @job_applications = @job_opportunity.job_applications
  end

  def create
    @job_opportunity = JobOpportunity.new(job_opportunity_params)
    @job_opportunity.company = current_employee.company
    if @job_opportunity.save
      redirect_to @job_opportunity
    else
      render 'new'
    end
  end

  def create_job_application
    @job_opportunity = JobOpportunity.find(params[:id])

    return unless @job_opportunity.active?

    job_application = JobApplication.create(
      job_opportunity: @job_opportunity,
      candidate: current_candidate
    )

    if job_application.save
      redirect_to job_application_path(job_application), notice: t('.success')
    else
      redirect_to @job_opportunity, alert: t('.failure')
    end
  end

  def inactivate_job_opportunity
    @job_opportunity = JobOpportunity.find(params[:id])
    @job_opportunity.inactive!
    redirect_to @job_opportunity
  end

  def activate_job_opportunity
    @job_opportunity = JobOpportunity.find(params[:id])
    @job_opportunity.active!
    redirect_to @job_opportunity
  end

  def edit
    @job_opportunity = JobOpportunity.find(params[:id])
  end

  def update
    @job_opportunity = JobOpportunity.find(params[:id])
    @job_opportunity.update(job_opportunity_params)
    if @job_opportunity.save
      redirect_to job_opportunity_path(@job_opportunity)
    else
      render 'edit'
    end
  end

  private

  def job_opportunity_params
    params.require(:job_opportunity).permit(:job_title,
                                            :description,
                                            :job_level,
                                            :salary_range,
                                            :salary_range,
                                            :place,
                                            :number_of_positions,
                                            :limit_date,
                                            :company)
  end
end
