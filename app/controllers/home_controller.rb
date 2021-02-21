class HomeController < ApplicationController
    
  def index
    @job_opportunities = JobOpportunity.all
  end

end