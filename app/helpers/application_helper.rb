module ApplicationHelper
  def user_avatar(user, size: '50x50', link: nil)
    avatar = user.avatar.attached? ? user.avatar : 'icon.png'
    img = image_tag(avatar, size: size, style: 'border-radius: 50%;')

    link ? link_to(img, link) : img
  end

  def company_logo(company, size: '50x50', link: nil)
    logo = company.logo
    img = image_tag(logo.attached? ? logo : 'icon.png', size: size, style: 'border-radius: 50%;')

    link ? link_to(img, link) : img
  end

  def t_attr(str)
    t("activerecord.attributes.#{str}")
  end

  def see_more(instance)
    link_to fa_icon('eye', title: 'Ver', class: 'green-icon'), instance
  end

  def candidate_nav_links
    return unless current_candidate

    concat link_to 'Área do candidato', '/candidate/dashboard'
    concat link_to 'Meu perfil', "/u/#{current_candidate.id}"
    concat current_candidate.email
    concat link_to 'Sair', destroy_candidate_session_path, method: :delete
  end

  def employee_nav_links
    return unless current_employee

    concat link_to 'Área do colaborador', '/company/dashboard'
    concat current_employee.email
    concat "(#{current_employee.company.name} - #{current_employee.role})"
    concat link_to 'Sair', destroy_employee_session_path, method: :delete
  end

  def back_button(path = :back, method = :get)
    button_to I18n.t('go_back'), path, class: 'btn btn-secondary', method: method
  end
end
