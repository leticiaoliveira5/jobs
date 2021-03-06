class CompaniesController < ApplicationController

    before_action :authenticate_employee!, only: %i[:new, :create, :edit, :update]
    
    def index
        @companies = Company.all
    end
    
    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new
        @companies = Company.all
    end

    def create
        company_params = params.permit(:name,
                                                :domain,
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
        address: params[:company][:address],
        cnpj: params[:company][:cnpj])
        if @company.save
            redirect_to company_path(@company)
        else
            render 'edit'
        end
    end

end