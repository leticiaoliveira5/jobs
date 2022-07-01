require 'rails_helper'

RSpec.describe JobProposal, type: :model do
  describe 'validation' do
    it 'can not be created without fields' do
      company = create(:company)
      job_opportunity = create(:job_opportunity, company: company)
      candidate = create(:candidate)
      job_application = create(:job_application, candidate: candidate,
                                                 job_opportunity: job_opportunity)
      job_proposal = JobProposal.create(job_application: job_application,
                                        message: '',
                                        salary_proposal: '',
                                        start_date: '',
                                        candidate: candidate,
                                        job_opportunity: job_opportunity)
      expect(JobProposal.count).to eq(0)
      expect(job_proposal.errors.count).to eq(3)
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
