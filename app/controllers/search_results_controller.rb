class SearchResultsController < ApplicationController
  def index
    input = params[:search_input]
    @job_opportunities_search = if input.blank?
                                  nil
                                else
                                  JobOpportunity.search(input)
                                end
  end
end
