class CandidatesController < ApplicationController
  before_action :authenticate_candidate!, only: :dashboard

  def dashboard; end

  def show
    redirect_to root_path unless candidate_signed_in? || employee_signed_in?

    @candidate = Candidate.includes(:work_experiences, :candidate_skills).find(params[:id])
    @work_experiences = @candidate.work_experiences.order(start_date: :desc)
    @candidate_skills = @candidate.candidate_skills
  end
end
