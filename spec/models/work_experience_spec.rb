require 'rails_helper'

RSpec.describe WorkExperience, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:candidate) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:job_title) }
    it { is_expected.to validate_presence_of(:start_date) }

    it 'validates if end_date is after start_date' do
      obj = build(:work_experience, end_date: 2.weeks.ago, start_date: 1.day.ago)
      expect(obj).not_to be_valid
    end
  end

  describe '#set_status' do
    it 'set status to finished if end date is before today' do
      work_experience = build(:work_experience, start_date: 1.year.ago,
                                                end_date: 3.months.ago,
                                                status: nil)
      work_experience.save
      expect(work_experience.status).to eq 'finished'
    end
  end
end
