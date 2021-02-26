class CandidatesController < ApplicationController
    before_action :authenticate_candidate!

    def index 
      
    end

    def cancel_job_application(job_application, current_candidate)
    @candidate = Candidate.find_by(params[:id])
    @candidate.cancel_job_application!(job_application, current_candidate)
    redirect_to candidates_path(@candidate), notice: 'success'
    end

end