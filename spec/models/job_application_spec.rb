require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  context 'validation' do
    it 'candidate_must_have_basic_information' do
      job_opportunity = create(:job_opportunity)
      candidate = create(:candidate, cpf: '', address: '', about_me: '')
      build(:job_application, job_opportunity: job_opportunity, candidate: candidate, status: 0)

      expect(candidate.job_applications.count).to eq(0)
      expect(JobApplication.count).to eq(0)
    end
  end

  context '#destroy' do
    it 'deletes job application' do
      candidate = create(:candidate)
      job_application = create(:job_application, candidate: candidate)

      job_application.destroy!

      expect(candidate.job_applications.count).to eq(0)
      expect(JobApplication.count).to eq(0)
    end
  end
end
