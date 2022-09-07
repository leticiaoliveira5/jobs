module EmployeePanelHelper
  def job_proposal_link(job_proposal)
    link_name = "#{job_proposal.job_opportunity.job_title} - #{job_proposal.candidate.full_name} [#{job_proposal.status}]"
    link_to link_name, job_application_job_proposal_path(job_proposal.job_application, job_proposal)
  end

  def job_application_link(job_application)
    link_to "#{job_application.job_opportunity.job_title} - #{job_application.candidate.full_name}",
            job_application_path(job_application)
  end
end
