class CandidateSkillsController < ApplicationController
  before_action :authenticate_candidate!

  def create
    name = helpers.normalize_name(skill_params[:name])
    @skill = Skill.find_or_create_by(name: name)
    @candidate_skill = current_candidate.candidate_skills.new(level: skill_params[:level].to_i)
    @candidate_skill.skill = @skill
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
