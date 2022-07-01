require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  describe 'validations' do
    it 'is valid when candidate has basic information' do
      candidate = create(:candidate)
      job_application = build(:job_application, candidate: candidate, status: 0)

      expect(job_application).to be_valid
    end

    it "is not valid when candidate doesn't have basic information" do
      candidate = create(:candidate, cpf: '', address: '', about_me: '')
      job_application = build(:job_application, candidate: candidate, status: 0)

      expect(job_application).not_to be_valid
    end
  end

  describe '#destroy' do
    let!(:candidate) { create(:candidate) }
    let(:job_application) { create(:job_application, candidate: candidate) }

    it 'deletes job application' do
      job_application.destroy!

      expect(candidate.job_applications.count).to eq(0)
      expect(described_class.count).to eq(0)
    end
  end
end
