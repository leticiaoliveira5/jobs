require 'rails_helper'

RSpec.describe JobOpportunity, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:candidates) }
    it { is_expected.to have_many(:job_applications) }
    it { is_expected.to have_many(:job_proposals) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of(:job_title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:job_level) }
    it { is_expected.to validate_presence_of(:salary_range) }
    it { is_expected.to validate_presence_of(:place) }
    it { is_expected.to validate_presence_of(:limit_date) }
    it { is_expected.to validate_presence_of(:number_of_positions) }
    it { is_expected.to validate_numericality_of(:number_of_positions) }

    it 'limit date cannot be in the past' do
      job_opportunity = described_class.new(limit_date: '18/11/1958')

      expect(job_opportunity).not_to be_valid
      expect(job_opportunity.errors).to include(:limit_date)
    end
  end
end
