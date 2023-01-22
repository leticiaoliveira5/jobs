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
            title: 'Inativar vaga', method: :post
  end

  def activate_link(job_opportunity)
    link_to fa_icon('toggle-off', title: 'Ativar vaga', class: 'gray-icon'),
            activate_job_opportunity_job_opportunity_path(job_opportunity),
            title: 'Ativar vaga', method: :post
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

  def job_opportunity_status_tag(status)
    color = case status
            when 'inactive'
              'bg-gray'
            when 'active'
              'bg-green'
            end

    tag.span(t(".status.#{status}"), class: "tag #{color}")
  end

  def basic_info(job_opportunity)
    attributes = {
      salary_range: job_opportunity.salary_range,
      job_level: job_opportunity.job_level,
      limit_date: job_opportunity.limit_date&.strftime('%d/%b/%Y'),
      positions: job_opportunity.number_of_positions
    }

    tag.ul(class: 'no-bullets green-icon') do
      attributes.each do |key, value|
        concat tag.li(fa_icon(basic_info_icons[key], title: t(".#{key}"), text: value)) if value
      end
    end
  end

  def basic_info_icons
    {
      salary_range: 'money',
      job_level: 'info',
      limit_date: 'calendar',
      positions: 'user'
    }
  end
end
