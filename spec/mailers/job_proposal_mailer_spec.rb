require 'rails_helper'

describe JobProposalMailer do
  describe '#notify_proposal' do
    let(:job_proposal) { create(:job_proposal) }

    it 'should build and email correctly' do
      mail = described_class.notify_proposal(job_proposal.id)
      expected_text = "#{job_proposal.candidate.firstname}, sua candidatura à vaga"

      expect(mail.subject).to eq 'Você recebeu uma proposta!'
      expect(mail.to).to include job_proposal.candidate.email
      expect(mail.to).to eq [job_proposal.candidate.email]
      expect(mail.body).to include expected_text
    end
  end
end
