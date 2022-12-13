module CandidateProfileHelper
  include ApplicationHelper

  def add_item_button(id)
    return unless candidate_signed_in?

    fa_icon('plus', title: 'Adicionar', id: id)
  end

  def delete_item_button(item)
    return unless candidate_signed_in?

    link_to fa_icon('trash', title: 'Excluir'), delete_path(item), method: :delete
  end

  def edit_candidate_info_button
    return unless candidate_signed_in?

    link_to fa_icon('edit', title: 'Editar', id: 'edit_candidate_button'),
            edit_candidate_registration_path
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
    bold_title = tag.b(title)
    if kind.present?
      bold_title.concat(" (#{kind})")
    else
      bold_title
    end
  end

  def graduation_year(year)
    return if year.blank?

    "#{t_attr('degree.graduation_year')}: #{year}"
  end

  def course_certificate_link(certificate_link)
    return unless candidate_signed_in? && certificate_link

    link_to(fa_icon('certificate', title: 'Certificado'),
            "http://#{certificate_link}",
            target: :_blank,
            title: t('candidates.show.see_certificate'),
            rel: :noopener).concat(tag.br)
  end

  def sidebar_avatar(avatar)
    img = avatar.attached? ? avatar : 'icon.png'
    image_tag(img, size: '250x250', class: 'sidebar-avatar')
  end

  def candidate_locale(locale)
    return unless locale

    tag.p(fa_icon('map-pin').concat(" #{locale}"))
  end

  def candidate_website(website)
    return unless website

    tag.i(class: 'url_icon').concat(
      tag.p(tag.a(website, href: "http://#{website}", target: :_blank))
    )
  end
end
