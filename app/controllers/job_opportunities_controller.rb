class JobOpportunitiesController < ApplicationController
   
    before_action :authenticate_employee!, only: [:create, :new, :edit]
    

    def new
        @job_opportunity = JobOpportunity.new
        @job_opportunities = JobOpportunity.all
    end

    def show
        @job_opportunity = JobOpportunity.find(params[:id])
    end

    def create
        job_opportunity_params = params.require(:job_opportunity).permit(:job_title, 
                                                                        :description, 
                                                                        :job_level, 
                                                                        :salary_range, 
                                                                        :place, 
                                                                        :company)
        @job_opportunity = JobOpportunity.new(job_opportunity_params)
        @job_opportunity.company = current_employee.company
        if @job_opportunity.save
            redirect_to @job_opportunity
        else
            render 'new'
        end
        
    end

end