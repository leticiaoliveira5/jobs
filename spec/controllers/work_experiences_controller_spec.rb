require 'rails_helper'

RSpec.describe WorkExperiencesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }

  describe '#create' do
    it 'with candidate signed in, creates work experience', candidate_signed_in: true do
      post :create, params: { work_experience: {
        job_title: 'Title Test', start_date: 2.months.ago, company_name: 'Company Name'
      } }

      expect(response).to redirect_to candidate_path(candidate)
      expect(candidate.work_experiences.count).to eq 1
    end
  end

  describe '#destroy' do
    it 'with candidate signed in, deletes work experience', candidate_signed_in: true do
      work_experience = create(:work_experience, candidate: candidate)

      delete :destroy, params: { id: work_experience.id }

      expect(response).to redirect_to candidate_path(candidate)
      expect(candidate.work_experiences.count).to eq 0
    end
  end
end
