class CandidateSkillsController < ApplicationController
  before_action :authenticate_candidate!

  def create
    @candidate_skill = current_candidate.candidate_skills.new(skill: find_or_create_skill,
                                                              level: skill_params[:level].to_i)
    @candidate_skill.save
    redirect_to candidate_path(current_candidate)
  end

  def destroy
    @candidate_skill = current_candidate.candidate_skills.find(params[:id])
    @candidate_skill.destroy
    redirect_to candidate_path(current_candidate)
  end

  private

  def find_or_create_skill
    name_input = skill_params[:name]
    name = name_input[0].capitalize + name_input[1..].downcase
    Skill.find_or_create_by(name: name)
  end

  def skill_params
    params.require(:candidate_skill).permit(:name, :level)
  end
end
