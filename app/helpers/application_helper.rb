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
    link_to fa_icon('eye', title: 'Ver', class: 'text-primary ms-1'), instance
  end

  def nav_links
    concat link_to 'Empresas', companies_path, class: 'nav-link'
    concat link_to 'Vagas', job_opportunities_path, class: 'nav-link'
    concat link_to 'Candidatos', candidates_path, class: 'nav-link'
  end

  def candidate_nav_links
    return unless current_candidate

    concat link_to 'Área do candidato', '/candidate/dashboard', class: 'nav-link'
    concat link_to 'Meu perfil', "/u/#{current_candidate.id}", class: 'nav-link'
    concat content_tag(:span, current_candidate.email, class: 'navbar-text')
    concat link_to 'Sair', destroy_candidate_session_path, method: :delete, class: 'nav-link'
  end

  # rubocop:disable-next Metrics/AbcSize
  def employee_nav_links
    return unless current_employee

    concat link_to 'Área do colaborador', '/company/dashboard', class: 'nav-link'
    concat content_tag(:span, current_employee.email, class: 'navbar-text')
    concat content_tag(:span, "(#{current_employee.company.name} - #{current_employee.role})",
                       class: 'navbar-text')
    concat link_to 'Sair', destroy_employee_session_path, method: :delete, class: 'nav-link'
  end

  def back_button(path = :back, method = :get)
    button_to I18n.t('go_back'), path, class: 'btn btn-secondary', method: method
  end
end
