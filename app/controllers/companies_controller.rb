class CompaniesController < ApplicationController

    before_action :authenticate_employee!, only: [:new, :create, :edit]

    
    def index
        @companies = Company.all
    end

    def new
        @company = Company.new
        @companies = Company.all
    end

    def create
        company_params = params.require(:company).permit(:name, :domain, :city, :state)
        @company = Company.new(company_params)
        redirect_to company_path(@company)
    end

    def edit
        @company = Company.find(params[:id])
    end

    def update
        @company = Company.find(params[:id])
        @company.update(name: params[:company][:name], 
        domain: params[:company][:domain],
        city: params[:company][:city],
        state: params[:company][:state])
        redirect_to company_path(@company)
    end

    def show
        @company = Company.find(params[:id])
    end

end