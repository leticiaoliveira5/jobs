class SearchResultsController < ApplicationController
  def search
    @job_opportunities_search = JobOpportunity.search(params[:search_input]) if params[:search_input].present?
  end

  def index
    @job_opportunities_search = JobOpportunity.search(params[:search_input]) if params[:search_input].present?
  end
end
