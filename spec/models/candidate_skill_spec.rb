require 'rails_helper'

RSpec.describe CandidateSkill, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:candidate) }
    it { is_expected.to belong_to(:skill) }
  end
end
