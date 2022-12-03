class CandidateSkillsController < ApplicationController
  before_action :authenticate_candidate!

  def create
    @find_or_create_skill = Skill.find_or_create_by(name: normalize_name(skill_params[:name]))
    @candidate_skill = current_candidate.candidate_skills.new(level: skill_params[:level])
    @candidate_skill.skill = @find_or_create_skill
    @candidate_skill.save
    redirect_to candidate_path(current_candidate)
  end

  def destroy
    @candidate_skill = current_candidate.candidate_skills.find(params[:id])
    @candidate_skill.destroy
    redirect_to candidate_path(current_candidate)
  end

  private

  def skill_params
    params.require(:candidate_skill).permit(:name, :level)
  end
end