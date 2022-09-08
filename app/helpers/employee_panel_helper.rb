module EmployeePanelHelper
  def job_proposal_link(job_proposal)
    link_to 'Ver proposta',
            job_application_job_proposal_path(job_proposal.job_application, job_proposal)
  end

  def job_application_link(job_application)
    link_to 'Ver candidatura', job_application_path(job_application)
  end
end
