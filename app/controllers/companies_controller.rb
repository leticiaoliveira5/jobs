class CompaniesController < ApplicationController
  # before_action :authenticate_employee!, only: %i[create new edit]

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
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

  private

  def company_params
    params.require(:company).permit(:name, :domain, :address, :cnpj)
  end
end
