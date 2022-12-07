class DegreesController < ApplicationController
  before_action :authenticate_candidate!

  def create
    @degree = current_candidate&.degrees&.new(degree_params)
    @degree.save
    redirect_to candidate_path(current_candidate)
  end

  def destroy
    @degree = current_candidate&.degrees&.find(params[:id])
    @degree.destroy
    redirect_to candidate_path(current_candidate)
  end

  private

  def degree_params
    params.require(:degree).permit(:title, :graduation_year, :kind)
  end
end
