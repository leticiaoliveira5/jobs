class CandidatesController < ApplicationController
  before_action :authenticate_candidate!, only: :dashboard
  before_action :authenticate_user, only: :show

  def dashboard; end

  def show
    @candidate = Candidate.includes(:work_experiences, :candidate_skills,
                                    :courses, :languages).find(params[:id])
    @work_experiences = @candidate.work_experiences.order(start_date: :desc)
    @candidate_skills = @candidate.candidate_skills
    @courses = @candidate.courses
    @languages = @candidate.languages
  end

  private

  def authenticate_user
    redirect_to root_path unless candidate_signed_in? || employee_signed_in?
  end
end
