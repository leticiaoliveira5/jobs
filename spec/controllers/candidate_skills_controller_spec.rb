require 'rails_helper'

RSpec.describe CandidateSkillsController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }
  let(:candidate_skill) { create(:candidate_skill, candidate: candidate) }

  describe '#create' do
    it 'with candidate signed in, creates candidate skill', candidate_signed_in: true do
      post :create, params: { candidate_skill: { name: 'NaMe' } }

      expect(response).to redirect_to candidate_path(candidate)
      expect(Skill.last.name).to eq 'Name'
      expect(candidate.candidate_skills.count).to eq 1
    end
  end

  describe '#destroy' do
    it_behaves_like 'candidate profile destroy', object: 'candidate_skill'
  end
end
