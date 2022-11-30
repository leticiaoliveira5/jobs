class ResumesController < ApplicationController
  def show
    unless candidate_signed_in? || employee_signed_in?
      redirect_to root_path, alert: 'Você não tem permissão para ver esta página'
    end
    @resume = Resume.find(params[:id])
  end
end
