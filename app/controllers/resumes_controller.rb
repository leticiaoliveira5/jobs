class ResumesController < ApplicationController

    def index
    end

    def show
        @resume = Resume.find(params[:id])
    end

    def edit
        @resume = Resume.find(params[:id])
    end

      def update
        @resume = resume.find(params[:id])
        @resume.update(name: params[:resume][:name], 
        domain: params[:resume][:domain],
        cnpj: params[:resume][:cnpj],
        address: params[:resume][:address])
        redirect_to resume_path(@resume)
    end

end