require 'rails_helper'

RSpec.describe JobProposal, type: :model do
  describe 'validation' do
    let!(:job_application) { create(:job_application) }
    let(:job_proposal) do
      described_class.new(
        job_application: job_application,
        candidate: job_application.candidate,
        job_opportunity: job_application.job_opportunity
      )
    end

    it 'is not valid without basic fields' do
      expect(job_proposal).not_to be_valid
      expect(job_proposal.errors).to include(:message,
                                             :salary_proposal,
                                             :start_date)
    end
  end

  describe '#check_number_of_positions' do
    let!(:job_application) { create(:job_application) }
    let(:job_proposal) do
      create(:job_proposal, job_application: job_application,
                            candidate: job_application.candidate,
                            job_opportunity: job_application.job_opportunity)
    end

    it 'is deactivated when candidate accepts proposal' do
      job_proposal.accepted!
      job_opportunity = job_proposal.job_opportunity

      expect { job_proposal.check_number_of_positions }.to change(job_opportunity, :status).to('inactive')
    end
  end
end
