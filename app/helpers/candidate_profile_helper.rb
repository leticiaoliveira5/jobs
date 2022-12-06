module CandidateProfileHelper
  def add_item_button(id)
    return unless candidate_signed_in?

    tag.button('+', id: id)
  end

  def delete_candidate_skill_button(skill)
    return unless candidate_signed_in?

    link_to tag.button('trash_icon'), candidate_skill_path(skill.id), method: :delete
  end

  def delete_course_button(course_id)
    return unless candidate_signed_in?

    link_to tag.button('trash_icon'), course_path(course_id), method: :delete
  end

  def course_certificate_link(certificate_link)
    return unless candidate_signed_in? && certificate_link

    link_to('Certificate_icon',
            "http://#{certificate_link}",
            target: :_blank,
            title: t('candidates.show.see_certificate'),
            rel: :noopener).concat(tag.br)
  end
end
