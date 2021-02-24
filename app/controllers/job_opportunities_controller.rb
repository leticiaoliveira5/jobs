class JobOpportunitiesController < ApplicationController
   
    before_action :authenticate_employee!, only: %i[:create, :new, :edit]
    before_action :authenticate_candidate!, only: %i[:create_job_application]

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
                                                                        :number_of_positions,
                                                                        :limit_date, 
                                                                        :company)
        @job_opportunity = JobOpportunity.new(job_opportunity_params)
        @job_opportunity.company = current_employee.company
        if @job_opportunity.save
            redirect_to @job_opportunity
        else
            render 'new'
        end
        
    end

    def create_job_application
        @job_opportunity = JobOpportunity.find(params[:id])
        unless candidate_signed_in?
        redirect_to new_candidate_session_path, notice: "Você precisa registrar-se para continuar"
        else
            if @job_opportunity.active? && current_candidate.job_applications.find_by(job_opportunity: @job_opportunity) == nil 
            @job_opportunity.create_job_application!(@job_opportunity, current_candidate)
            redirect_to @job_opportunity, notice: t(".success")
            else 
            redirect_to @job_opportunity, notice: t(".failure")
            end
        end
    end

    def inactivate_job_opportunity
    @job_opportunity = JobOpportunity.find(params[:id])
    @job_opportunity.inactive!
    redirect_to @job_opportunity
    end

    def activate_job_opportunity
        @job_opportunity = JobOpportunity.find(params[:id])
        @job_opportunity.active!
        redirect_to @job_opportunity
    end

end