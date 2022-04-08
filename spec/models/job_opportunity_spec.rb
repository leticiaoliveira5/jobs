require 'rails_helper'

RSpec.describe JobOpportunity, type: :model do
  context 'validation' do
    it 'limit date cannot be in the past' do
      job_opportunity = build(:job_opportunity, limit_date: '18/11/1958')

      expect(job_opportunity.valid?).to eq false
      expect(job_opportunity.errors.count).to eq 1
      expect(JobOpportunity.count).to eq(0)
    end
  end

  context '#check_number_of_positions' do
    it 'is deactivated when candidate accepts proposal' do
      company = create(:company)
      job_opportunity = create(:job_opportunity, company: company, number_of_positions: 1)
      candidate = create(:candidate)
      job_application = create(:job_application, candidate: candidate,
                                                 job_opportunity: job_opportunity)
      job_proposal = create(:job_proposal, job_application: job_application,
                                           candidate: candidate,
                                           job_opportunity: job_opportunity)

      job_proposal.accepted!
      job_proposal.check_number_of_positions

      expect(job_opportunity.status).to eq 'inactive'
    end
  end
end
