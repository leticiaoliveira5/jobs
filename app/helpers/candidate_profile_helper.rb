module CandidateProfileHelper
  def add_item_button(id)
    return unless candidate_signed_in?

    tag.button('+', id: id)
  end

  def delete_item_button(item)
    return unless candidate_signed_in?

    link_to tag.button('trash_icon'), delete_path(item), method: :delete
  end

  def delete_path(item)
    case item
    when Course
      course_path(item)
    when CandidateSkill
      candidate_skill_path(item)
    when WorkExperience
      work_experience_path(item)
    when Language
      language_path(item)
    when Degree
      degree_path(item)
    end
  end

  def degree_headline(title, kind)
    if kind.present?
      tag.b(title).concat(" (#{kind})")
    else
      tag.b(title)
    end
  end

  def graduation_year(year)
    return if year.blank?

    "#{t_attr('degree.graduation_year')}: #{year}"
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
