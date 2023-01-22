module JobOpportunityHelper
  include Devise::Controllers::Helpers

  def employee_links(job_opportunity)
    return unless current_employee&.company == job_opportunity.company

    if job_opportunity.active?
      inactivate_link(job_opportunity)
    else
      activate_link(job_opportunity)
    end.concat(edit_link(job_opportunity))
  end

  def inactivate_link(job_opportunity)
    link_to fa_icon('toggle-on', title: 'Inativar vaga', class: 'gray-icon'),
            inactivate_job_opportunity_job_opportunity_path(job_opportunity),
            method: :post
  end

  def activate_link(job_opportunity)
    link_to fa_icon('toggle-off', title: 'Ativar vaga', class: 'gray-icon'),
            activate_job_opportunity_job_opportunity_path(job_opportunity),
            method: :post
  end

  def edit_link(job_opportunity)
    link_to fa_icon('pencil', title: 'Editar vaga', class: 'gray-icon'),
            edit_job_opportunity_path(job_opportunity), title: 'Editar vaga'
  end

  def candidate_links(job_opportunity)
    return if employee_signed_in? || job_opportunity.inactive?

    if candidate_signed_in?
      apply_link(job_opportunity)
    else
      sign_up_and_apply_link(job_opportunity)
    end
  end

  def apply_link(job_opportunity)
    if job_opportunity.candidates.include?(current_candidate)
      job_application = job_opportunity.job_applications.find_by(candidate: current_candidate)
      button_to 'Cancelar candidatura',
                job_application_path(job_application),
                method: :delete, class: 'button'
    else
      link_to 'Inscrever-se nesta vaga',
              create_job_application_job_opportunity_path(job_opportunity),
              method: :post
    end
  end

  def sign_up_and_apply_link(job_opportunity)
    link_to 'Faça login para inscrever-se nesta vaga',
            create_job_application_job_opportunity_path(job_opportunity),
            method: :post
  end

  def view_job_opportunity_link(job_opportunity)
    link_to fa_icon('eye', title: 'Ver detalhes da vaga', class: 'green-icon'),
            job_opportunity_path(job_opportunity)
  end

  def job_application_links(job_application)
    return unless job_application.waiting?

    id = job_application.id
    make_proposal_icon(id).concat(reject_application_icon(id))
  end

  def make_proposal_icon(id)
    link_to(fa_icon('eye'),
            new_job_application_job_proposal_path(id),
            class: 'green-icon', title: 'Fazer proposta')
  end

  def reject_application_icon(id)
    link_to(fa_icon('close'),
            decline_job_application_path(id),
            class: 'green-icon',
            title: 'Rejeitar candidatura', method: :post)
  end

  def job_opportunity_status_tag(status)
    color = case status
            when 'inactive'
              'bg-gray'
            when 'active'
              'bg-green'
            end

    tag.span(t(".status.#{status}"), class: "tag #{color}")
  end
  end

  def basic_info(salary_range, job_level, limit_date, positions)
    format_date = limit_date&.strftime('%d/%b/%Y')

    tag.ul(class: 'no-bullets green-icon') do
      concat tag.li(fa_icon('money', title: t('.salary_range'), text: salary_range)) if salary_range
      concat tag.li(fa_icon('info', title: t('.job_level'), text: job_level)) if job_level
      concat tag.li(fa_icon('calendar', title: t('.limit_date'), text: format_date)) if limit_date
      concat tag.li(fa_icon('user', title: t('.positions'), text: positions)) if positions
    end
  end
end
