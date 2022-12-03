module CandidateProfileHelper
  def add_candidate_skill_button
    return unless candidate_signed_in?

    content_tag(:button, '+', id: 'add_candidate_skill_button') 
  end

  def delete_candidate_skill_button(skill)
    return unless candidate_signed_in?
    
    link_to content_tag(:button, 'trash_icon'), candidate_skill_path(skill.id), method: :delete 
  end
end
