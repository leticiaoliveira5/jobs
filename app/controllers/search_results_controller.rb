class SearchResultsController < ApplicationController
  def search
    @job_opportunities_search = JobOpportunity.search(search_input) if search_input.present?
  end

  def index
    @job_opportunities_search = JobOpportunity.search(search_input) if search_input.present?
  end

  private

  def search_input
    params[:search_input]
  end
end
