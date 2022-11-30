require 'rails_helper'

RSpec.describe WorkExperience, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:candidate) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:job_title) }
    it { is_expected.to validate_presence_of(:start_date) }
  end
end
