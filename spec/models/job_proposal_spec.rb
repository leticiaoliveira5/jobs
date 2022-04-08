require 'rails_helper'

RSpec.describe JobProposal, type: :model do
  context 'validation' do
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
end
