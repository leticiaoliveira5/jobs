require 'rails_helper'

RSpec.describe CandidateSkill, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:candidate) }
    it { is_expected.to belong_to(:skill) }
  end

  describe 'enum' do
    it { is_expected.to define_enum_for(:level).with_values([:beginner, :intermediate, :advanced]) }
  end

  describe 'validation' do
    it { is_expected.to validate_uniqueness_of(:skill_id).scoped_to(:candidate_id) }
  end

  describe 'level_humanized_names' do
    it 'lists enum values' do
      expect(described_class.level_humanized_names)
        .to eq [['Iniciante', 0], ['Intermediário', 1], ['Avançado', 2]]
    end
  end
end
