class JobOpportunityComponent < ViewComponent::Base
  delegate :employee_signed_in?, :candidate_signed_in?, :current_candidate, :current_employee,
           to: Devise::Controllers::Helpers
  
  def initialize(job_opportunity:)
    super
    @job_opportunity = job_opportunity
  end

  def inactivate_link
    return unless employee_signed_in? && current_employee.company == @job_opportunity.company
    return if @job_opportunity.inactive?

    link_to 'Inativar vaga',
            inactivate_job_opportunity_job_opportunity_path(@job_opportunity),
            method: :post
  end

  def activate_link
    return unless employee_signed_in? && current_employee.company == @job_opportunity.company
    return if @job_opportunity.active?

    link_to 'Ativar vaga',
            activate_job_opportunity_job_opportunity_path(@job_opportunity),
            method: :post
  end

  def edit_link
    return unless employee_signed_in? && current_employee.company == @job_opportunity.company

    link_to 'Editar vaga', edit_job_opportunity_path(@job_opportunity)
  end

  def apply_link
    return unless candidate_signed_in?

    if @job_opportunity.candidates.include?(current_candidate)
      'Você está inscrito nesta vaga.'
    elsif @job_opportunity.active?
      link_to 'Inscrever-se nesta vaga',
              create_job_application_job_opportunity_path(@job_opportunity),
              method: :post
    end
  end

  def sign_up_and_apply_link
    return if employee_signed_in? || candidate_signed_in?

    link_to 'Faça login para inscrever-se nesta vaga',
            create_job_application_job_opportunity_path(@job_opportunity),
            method: :post
  end
end
