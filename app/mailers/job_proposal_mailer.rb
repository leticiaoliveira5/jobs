class JobProposalMailer < ApplicationMailer
  def notify_proposal(job_proposal_id)
    @job_proposal = JobProposal.find_by(id: job_proposal_id)
    # rubocop:todo-next Rails/I18nLocaleTexts
    mail(subject: 'Você recebeu uma proposta!',
         to: @job_proposal.candidate.email)
  end
end
