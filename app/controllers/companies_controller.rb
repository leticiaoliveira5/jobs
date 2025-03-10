# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :authenticate_employee!, only: %i[dashboard edit update]
  before_action :set_company, only: %i[dashboard edit update]

  def index
    @search = params[:search_input]
    @companies = Company.includes(:active_job_opportunities).search(@search)
                        .page(params[:page]).per(params[:per_page])
  end

  def show
    @company = Company.includes(:address).find(params[:id])
    @job_opportunities = @company.job_opportunities.active
  end

  def create
    @company = Company.new(company_params)
    redirect_to @company if @company.save
  end

  def edit
    @company.build_address unless @company.address
  end

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
    params.require(:company).permit(:name, :domain, :document, :logo, address_attributes)
  end

  def address_attributes
    { address_attributes: %i[zipcode street number neighborhood city state country] }
  end
end
