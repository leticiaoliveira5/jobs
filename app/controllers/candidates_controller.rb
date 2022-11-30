class CandidatesController < ApplicationController
  before_action :authenticate_candidate!

  def dashboard; end
end
