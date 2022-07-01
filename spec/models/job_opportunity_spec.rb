require 'rails_helper'

RSpec.describe JobOpportunity, type: :model do
  describe 'validation' do
    it 'limit date cannot be in the past' do
      job_opportunity = build(:job_opportunity, limit_date: '18/11/1958')

      expect(job_opportunity.valid?).to eq false
      expect(job_opportunity.errors).to include(:limit_date)
    end
  end

  context '#check_number_of_positions' do
    before do
      job_opportunity = create(:job_opportunity, number_of_positions: 1)
      candidate = create(:candidate)
      job_application = create(:job_application, candidate: candidate,
                                                 job_opportunity: job_opportunity)
      job_proposal = create(:job_proposal, job_application: job_application,
                                           candidate: candidate,
                                           job_opportunity: job_opportunity)
    end

    it 'is deactivated when candidate accepts proposal' do
      job_proposal.accepted!
      
      expect { 
        job_proposal.check_number_of_positions 
      }.to change(job_opportunity, :status).to('inactive')
    end
  end
end
