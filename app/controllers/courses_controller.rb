class CoursesController < ApplicationController
  before_action :authenticate_candidate!

  def create
    @course = current_candidate.courses.new(course_params)
    @course.save
    redirect_to candidate_path(current_candidate)
  end

  def destroy
    @course = current_candidate.courses.find(params[:id])
    @course.destroy
    redirect_to candidate_path(current_candidate)
  end

  private

  def course_params
    params.require(:course).permit(:title, :certificate_link, :description)
  end
end
