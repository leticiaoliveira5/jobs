class ResumesController < ApplicationController
  before_action :authenticate_candidate!, only: %i[create edit update]

  def index; end

  def show
    unless candidate_signed_in? || employee_signed_in?
      redirect_to root_path, alert: 'Você não tem permissão para ver esta página'
    end
    @resume = Resume.joins(:candidate).find(params[:id])
  end

  def create
    @resume = Resume.new(resume_params)
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    @resume.update(resume_params)
    if @resume.save
      redirect_to resume_path(@resume), notice: t('.success')
    else
      render 'edit'
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:address,
                                   :education,
                                   :experience,
                                   :languages,
                                   :abilities,
                                   :courses)
  end
end
