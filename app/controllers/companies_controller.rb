class CompaniesController < ApplicationController
  before_action :authenticate_employee!, only: %i[employee_panel edit]

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @job_opportunities = @company.job_opportunities.active
  end

  def create
    @company = Company.new(company_params)
    redirect_to @company if @company.save
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render 'edit'
    end
  end

  def employee_panel
    @company = Company.find(params[:id])
    redirect_to(root_path) unless @company.employees.include?(current_employee)
    @active_job_opportunities = @company.job_opportunities.active
    @inactive_job_opportunities = @company.job_opportunities.inactive
    @job_proposals = @company.job_proposals
    @job_applications = @company.job_applications
  end

  private

  def company_params
    params.require(:company).permit(:name, :domain, :address, :cnpj)
  end
end
