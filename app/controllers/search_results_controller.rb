class SearchResultsController < ApplicationController
  def index
    @job_opportunities_search = search(search_input) if search_input.present?
  end

  private

  def search(search)
    JobOpportunity.joins(:company).where('job_title LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%")
  end

  def search_input
    params[:search_input]
  end
end
