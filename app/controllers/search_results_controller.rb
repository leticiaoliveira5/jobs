class SearchResultsController < ApplicationController
  def index
    input = params[:search_input]
    @job_opportunities_search = JobOpportunity.search(input) if input.present?
  end
end
