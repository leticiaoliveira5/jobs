require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:job_applications) }
    it { is_expected.to have_many(:job_proposals) }
    it { is_expected.to have_many(:work_experiences) }
    it { is_expected.to have_many(:candidate_skills) }
    it { is_expected.to have_many(:courses) }
    it { is_expected.to have_many(:skills) }
  end

  describe 'validations' do
    it { is_expected.to validate_length_of(:document) }
  end
end
