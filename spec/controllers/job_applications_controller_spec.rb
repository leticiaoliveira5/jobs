require 'rails_helper'

RSpec.describe JobApplicationsController, type: :controller do
  let(:candidate) { create(:candidate) }
  let(:job_application) { create(:job_application, candidate: candidate) }
  let(:employee) { create(:employee, company: job_application.company) }

  describe '#show' do
    it_behaves_like 'controller simple get action',
                    object: 'job_application', action: 'show', template: 'show'
  end

  describe '#destroy' do
    it 'deletes job application and redirects' do
      job_application = create(:job_application, candidate: candidate)

      sign_in(candidate)

      expect do
        delete :destroy, params: { id: job_application.id }
      end.to change(JobApplication, :count).by(-1)

      expect(response).to redirect_to(candidates_path(candidate))
      expect(flash[:notice]).to be_present
    end
  end

  describe '#decline' do
    it 'updates status and sends flash message' do
      sign_in(employee)

      post :decline, params: { id: job_application.id }

      expect(job_application.reload.status).to eq 'declined'
      expect(response).to redirect_to company_path(job_application.company)
      expect(flash[:notice]).to be_present
    end
  end
end
