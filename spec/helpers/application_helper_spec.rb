require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'enum_humanized_names' do
    it 'lists enum values' do
      expect(enum_humanized_names(CandidateSkill, 'level'))
        .to eq %w[Iniciante Intermediário Avançado]
    end
  end
end
