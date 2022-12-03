require 'rails_helper'

RSpec.describe CandidateSkill, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:candidate) }
    it { is_expected.to belong_to(:skill) }
  end

  describe 'level_humanized_names' do
    it 'lists enum values' do
      expect(described_class.level_humanized_names)
        .to eq %w[Iniciante Intermediário Avançado]
    end
  end
end
