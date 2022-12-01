class CandidatesController < ApplicationController
  before_action :authenticate_candidate!

  def dashboard; end

  def show
    @candidate = Candidate.includes(:work_experiences).find(params[:id])
  end
end
