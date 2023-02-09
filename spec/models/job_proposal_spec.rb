require 'rails_helper'

RSpec.describe JobProposal, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to validate_presence_of(:salary_proposal) }
    it { is_expected.to validate_presence_of(:start_date) }
  end

  describe '#check_number_of_positions' do
    let!(:job_opportunity) { create(:job_opportunity, number_of_positions: '1') }
    let!(:job_application) { create(:job_application, job_opportunity: job_opportunity) }
    let(:job_proposal) do
      create(:job_proposal, job_application: job_application,
                            job_opportunity: job_opportunity)
    end

    it 'is deactivated when candidate accepts proposal' do
      job_proposal.accepted!
      job_opportunity = job_proposal.job_opportunity

      expect do
        job_proposal.check_number_of_positions
      end.to change(job_opportunity, :status).to('inactive')
    end
  end
end
