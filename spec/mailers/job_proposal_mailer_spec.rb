require 'rails_helper'

describe JobProposalMailer do
  describe '#notify_proposal' do
    let!(:company) { create(:company) }
    let!(:candidate) { create(:candidate, firstname: 'Juliana', email: 'juliana@mail.com') }
    let!(:job_opportunity) { create(:job_opportunity, job_title: 'Desenvolvedor', company: company) }
    let!(:job_application) { create(:job_application, candidate: candidate, job_opportunity: job_opportunity) }
    let(:job_proposal) { create(:job_proposal, job_application: job_application, candidate: candidate) }

    it 'should build and email correctly' do
      mail = described_class.notify_proposal(job_proposal.id)

      expect(mail.subject).to eq 'Você recebeu uma proposta!'
      expect(mail.to).to include 'juliana@mail.com'
      expect(mail.to).to eq ['juliana@mail.com']
      expect(mail.body).to include 'Juliana, sua candidatura à vaga'
    end
  end
end
