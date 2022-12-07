class LanguagesController < ApplicationController
  before_action :authenticate_candidate!

  def create
    @language = current_candidate&.languages&.new(language_params)
    @language.save
    redirect_to candidate_path(current_candidate)
  end

  def destroy
    @language = current_candidate&.languages&.find(params[:id])
    @language.destroy
    redirect_to candidate_path(current_candidate)
  end

  private

  def language_params
    params.require(:language).permit(:name, :proficiency)
  end
end
