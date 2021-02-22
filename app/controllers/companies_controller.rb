class CompaniesController < ApplicationController

    before_action :authenticate_employee!, only: [:new, :create, :edit, :update]
    
    def index
        @companies = Company.all
    end

    def new
        @company = Company.new
        @companies = Company.all
    end

    def show
        @company = Company.find(params[:id])
    end

    def create
        company_params = params.require(:company).permit(:name,
                                                :domain,
                                                :cnpj,
                                                :address,
                                                :address,
                                                :cnpj)
        @company = Company.new(company_params)
        redirect_to @company
    end

    def edit
        @company = Company.find(params[:id])
    end

    def update
        @company = Company.find(params[:id])
        @company.update(name: params[:company][:name], 
        domain: params[:company][:domain],
        cnpj: params[:company][:cnpj],
        address: params[:company][:address])
        redirect_to company_path(@company)
    end

 

end