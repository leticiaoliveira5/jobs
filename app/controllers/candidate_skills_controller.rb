class CandidateSkillsController < ApplicationController
  before_action :authenticate_candidate!

  def create
    @candidate_skill = build_candidate_skill
    @candidate_skill.save
    redirect_to candidate_path(current_candidate)
  end

  def destroy
    @candidate_skill = current_candidate.candidate_skills.find(params[:id])
    @candidate_skill.destroy
    redirect_to candidate_path(current_candidate)
  end

  private

  def build_candidate_skill
    name = skill_params[:name]
    current_candidate.candidate_skills.new(skill: Skill.find_or_create_by_name(name),
                                           level: skill_params[:level].to_i)
  end

  def skill_params
    params.require(:candidate_skill).permit(:name, :level)
  end
end
