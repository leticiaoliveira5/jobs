class CompaniesController < ApplicationController
  before_action :authenticate_employee!, only: %i[dashboard edit update]
  before_action :set_company, only: %i[dashboard edit update]

  def index
    @search = params[:search_input]
    @companies = if @search
                   Company.where('name ILIKE ? OR address ILIKE ? OR domain ILIKE ?',
                                 "%#{@search}%", "%#{@search}%", "%#{@search}%")
                 else
                   Company.all.includes(:active_job_opportunities)
                 end
  end

  def show
    @company = Company.find(params[:id])
    @job_opportunities = @company.job_opportunities.active
  end

  def create
    @company = Company.new(company_params)
    redirect_to @company if @company.save
  end

  def edit; end

  def update
    @company.update(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render 'edit'
    end
  end

  def dashboard
    @company = Company.includes(:job_applications,
                                :job_proposals,
                                :active_job_opportunities,
                                :inactive_job_opportunities).find(@company.id)
  end

  private

  def set_company
    @company = current_employee&.company
  end

  def company_params
    params.require(:company).permit(:name, :domain, :address, :document)
  end
end
