require 'rails_helper'

RSpec.describe WorkExperience, type: :model do
  describe 'associations' do
    it { should belong_to(:candidate) }
  end

  describe 'validations' do
    it { should validate_presence_of(:job_title) }
    it { should validate_presence_of(:start_date) }
  end
end
