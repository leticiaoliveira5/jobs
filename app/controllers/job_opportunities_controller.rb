# :reek:TooManyInstanceVariables { max_instance_variables: 5 }
class JobOpportunitiesController < ApplicationController
  before_action :set_job_opportunity, except: %i[index new create]
  before_action :authenticate_employee!, only: %i[create new edit]
  before_action :authenticate_candidate!, only: %i[create_job_application]

  def index
    @search = params[:search_input]
    @job_opportunities = JobOpportunity.search(@search).active.order(:created_at).page(params[:page]).per(params[:per_page])
  end

  def new
    @job_opportunity = JobOpportunity.new
  end

  def show
    return unless employee_signed_in?

    @employee = current_company == @job_opportunity.company
    @job_applications = @job_opportunity.job_applications.includes(:candidate).order(status: :asc)
  end

  def create
    @job_opportunity = current_company.job_opportunities.new(job_opportunity_params)
    if @job_opportunity.save
      redirect_to @job_opportunity
    else
      render 'new'
    end
  end

  def create_job_application
    return if @job_opportunity.inactive?

    job_application = @job_opportunity.job_applications.new(
      candidate: current_candidate,
      status: :waiting
    )

    if job_application.save
      redirect_to job_application_path(job_application), notice: t('.success')
    else
      redirect_to @job_opportunity, alert: t('.failure')
    end
  end

  def inactivate_job_opportunity
    @job_opportunity.inactive!
    redirect_to @job_opportunity
  end

  def activate_job_opportunity
    @job_opportunity.active!
    redirect_to @job_opportunity
  end

  def edit; end

  def update
    if @job_opportunity.update(job_opportunity_params)
      redirect_to @job_opportunity
    else
      render 'edit'
    end
  end

  private

  def set_job_opportunity
    @job_opportunity = JobOpportunity.find(params[:id])
  end

  def current_company
    current_employee&.company
  end

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
