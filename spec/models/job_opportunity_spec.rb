require 'rails_helper'

RSpec.describe JobOpportunity, type: :model do
  describe 'validation' do
    it 'limit date cannot be in the past' do
      described_class.new(limit_date: '18/11/1958')

      expect(job_opportunity).not_to be_valid
      expect(job_opportunity.errors).to include(:limit_date)
    end
  end
end
