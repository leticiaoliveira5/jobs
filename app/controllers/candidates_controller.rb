class CandidatesController < ApplicationController
  before_action :authenticate_candidate!, only: :dashboard
  before_action :authenticate_user, only: :show

  def dashboard
    @candidate = current_candidate
  end

  def show
    @candidate = Candidate.includes(:work_experiences, :candidate_skills,
                                    :courses, :languages, :degrees).find(params[:id])
    @work_experiences = @candidate.work_experiences.order(start_date: :desc)
    @degrees = @candidate.degrees.order(graduation_year: :desc)
    @courses = @candidate.courses
  end

  private

  def authenticate_user
    redirect_to root_path unless candidate_signed_in? || employee_signed_in?
  end
end
