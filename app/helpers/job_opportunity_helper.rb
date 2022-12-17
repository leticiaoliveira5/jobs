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
    link_to 'Inativar vaga',
            inactivate_job_opportunity_job_opportunity_path(job_opportunity),
            method: :post
  end

  def activate_link(job_opportunity)
    link_to 'Ativar vaga',
            activate_job_opportunity_job_opportunity_path(job_opportunity),
            method: :post
  end

  def edit_link(job_opportunity)
    link_to 'Editar vaga', edit_job_opportunity_path(job_opportunity)
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
end
