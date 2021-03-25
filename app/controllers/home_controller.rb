# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @job_opportunities = JobOpportunity.all
  end
end
