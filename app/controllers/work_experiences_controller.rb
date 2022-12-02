class WorkExperiencesController < ApplicationController
  before_action :authenticate_candidate!

  def create
    @work_experience = current_candidate&.work_experiences&.new(work_experience_params)
    redirect_to candidate_path(current_candidate) if @work_experience.save
  end

  # def update
  #   @work_experience = current_candidate&.work_experiences&.find(params[:id])
  #   @work_experience.update(work_experience_params)
  #   @work_experience.save
  # end

  # def destroy
  #   @work_experience = current_candidate&.work_experiences&.find(params[:id])
  #   @work_experience.destroy
  # end

  private

  def work_experience_params
    params.require(:work_experience).permit(:job_title, :start_date, :end_date, :company_name,
                                            :description, :sector, :location)
  end
end
