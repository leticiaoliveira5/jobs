class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all
    end

    def new
        @company = Company.new
    end
    
    def create
        company_params = params.require(:company).permit(:name, :domain)
        @company = Company.new(company_params)
    end

end