require 'rails_helper'

RSpec.describe CoursesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }
  let(:course) { create(:course, candidate: candidate) }

  describe '#create' do
    it 'with candidate signed in, creates course', candidate_signed_in: true do
      post :create, params: { course: { title: 'Pilates' } }

      expect(response).to redirect_to candidate_path(candidate)
      expect(Course.last.title).to eq 'Pilates'
      expect(candidate.courses.count).to eq 1
    end
  end

  describe '#destroy' do
    it 'with candidate signed in, deletes course', candidate_signed_in: true do
      delete :destroy, params: { id: course.id }

      expect(response).to redirect_to candidate_path(candidate)
      expect(candidate.courses.count).to eq 0
    end
  end
end
