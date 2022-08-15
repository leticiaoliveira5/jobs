require 'rails_helper'

RSpec.describe JobApplicationsController, type: :controller do
  describe '#show' do
    it_behaves_like 'controller simple get action',
                    object: 'job_application', action: 'show', template: 'show'
  end

  describe '#destroy' do
    it 'deletes job application' do
      candidate = create(:candidate)
      job_application = create(:job_application, candidate: candidate)

      sign_in(candidate)

      expect do
        delete :destroy, params: { id: job_application.id }
      end.to change(JobApplication, :count).by(-1)

      expect(response).to redirect_to(candidates_path(candidate))
    end
  end

  describe '#decline' do
    let!(:job_application) { create(:job_application) }
    let(:employee) { create(:employee, company: job_application.company) }

    it 'changes the status to declined' do
      sign_in(employee)

      post :decline, params: { id: job_application.id }

      expect(job_application.reload.status).to eq 'declined'
    end
  end
end
