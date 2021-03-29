require 'rails_helper'

describe JobProposalMailer do
  describe '#notfy_proposal' do
    it 'should build and email correctly' do
      company = create(:company)
      candidate = create(:candidate, firstname: 'Juliana', email: 'juliana@mail.com')
      job_opportunity = create(:job_opportunity, job_title: 'Desenvolvedor', company: company)
      job_application = create(:job_application, candidate: candidate, job_opportunity: job_opportunity)
      job_proposal = create(:job_proposal, job_application: job_application, candidate: candidate)
      mail = JobProposalMailer.notify_proposal(job_proposal.id)

      expect(mail.subject).to eq 'Você recebeu uma proposta!'
      expect(mail.to).to include 'juliana@mail.com'
      expect(mail.to).to eq ['juliana@mail.com']
      expect(mail.body).to include 'Juliana, sua candidatura à vaga'
    end
  end
end
