class CandidatesController < ApplicationController
  before_action :authenticate_candidate!, only: :dashboard
  before_action :authenticate_user, only: %i[show index]

  def dashboard
    @candidate = current_candidate
    @job_proposals = @candidate.job_proposals.order(created_at: :desc)
    @job_applications = @candidate.job_applications.order(created_at: :desc)
  end

  def index
    @search = search_param[:search]
    @candidates = Candidate.search(search_param).page(params[:page])
  end

  def show
    @candidate = Candidate.includes(:work_experiences, :candidate_skills,
                                    :courses, :languages, :degrees).find(params[:id])
    @work_experiences = @candidate.work_experiences.order(start_date: :desc)
    @degrees = @candidate.degrees.order(graduation_year: :desc)
    @courses = @candidate.courses
  end

  private

  def search_param
    params.permit(:search)
  end

  def authenticate_user
    redirect_to root_path unless candidate_signed_in? || employee_signed_in?
  end
end
