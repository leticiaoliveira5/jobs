module JobOpportunityHelper
  include Devise::Controllers::Helpers

  # crete component for these methods
  def inactivate_link(job_opportunity)
    return unless employee_signed_in? && current_employee.company == job_opportunity.company
    return if job_opportunity.inactive?

    link_to 'Inativar vaga',
            inactivate_job_opportunity_job_opportunity_path(job_opportunity),
            method: :post
  end

  def activate_link(job_opportunity)
    return unless employee_signed_in? && current_employee.company == job_opportunity.company
    return if job_opportunity.active?

    link_to 'Ativar vaga',
            activate_job_opportunity_job_opportunity_path(job_opportunity),
            method: :post
  end

  def edit_link(job_opportunity)
    return unless employee_signed_in? && current_employee.company == job_opportunity.company

    link_to 'Editar vaga', edit_job_opportunity_path(job_opportunity)
  end

  def apply_link(job_opportunity)
    return unless candidate_signed_in?

    candidate_applied = job_opportunity.candidates.include?(current_candidate)

    if job_opportunity.candidates.include?(current_candidate)
      'Você está inscrito nesta vaga.'
    elsif !candidate_applied && job_opportunity.active?
      link_to 'Inscrever-se nesta vaga',
              create_job_application_job_opportunity_path(job_opportunity),
              method: :post
    end
  end

  def sign_up_and_apply_link(job_opportunity)
    return if employee_signed_in? || candidate_signed_in?

    link_to 'Faça login para inscrever-se nesta vaga',
            create_job_application_job_opportunity_path(job_opportunity),
            method: :post
  end
end
