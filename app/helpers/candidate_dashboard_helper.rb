module CandidateDashboardHelper
  include ApplicationHelper

  def cancel_application_button(id)
    return unless candidate_signed_in?

    link_to fa_icon('close'),
            job_application_path(id),
            method: :delete,
            class: 'green-icon',
            title: 'Cancelar inscrição na vaga'
  end
end
