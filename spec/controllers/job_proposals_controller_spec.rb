require 'rails_helper'

RSpec.describe JobProposalsController, type: :controller, login_metadata: true do
  let(:job_proposal) { create(:job_proposal) }
  let(:candidate) { job_proposal.candidate }
  let(:job_application) { job_proposal.job_application }
  let(:employee) { create(:employee, company: job_application.company) }
  let(:job_proposal_params) { { id: job_proposal.id, job_application_id: job_application.id } }

  describe '#show', candidate_signed_in: true do
    it 'renders show' do
      get :show, params: job_proposal_params

      expect(response).to render_template('show')
    end
  end

  describe '#new', employee_signed_in: true do
    it 'renders new' do
      get :new, params: job_proposal_params

      expect(response).to render_template('new')
    end
  end

  describe '#create', employee_signed_in: true do
    context 'with valid params' do
      it 'creates job proposal and redirects to company' do
        expect do
          post :create,
               params: { job_application_id: job_application.id,
                         job_proposal: { message: 'Hello',
                                         start_date: 1.week.from_now,
                                         salary_proposal: 5000 } }
        end.to change(JobProposal, :count).by(1)

        expect(response).to redirect_to company_path(employee.company)
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid params' do
      it 'renders new' do
        expect do
          post :create, params: { job_application_id: job_application.id,
                                  job_proposal: { message: 'Hello' } }
        end.not_to change(JobProposal, :count)

        expect(response).to render_template('new')
      end
    end
  end

  describe '#accept', candidate_signed_in: true do
    it 'updates status and redirects with flash message' do
      post :accept, params: job_proposal_params

      expect(response).to redirect_to job_application_job_proposal_path(job_proposal)
      expect(job_proposal.reload.status).to eq('accepted')
      expect(flash[:notice]).to be_present
    end
  end

  describe '#reject', candidate_signed_in: true do
    it 'updates status and redirects with flash message' do
      post :reject, params: job_proposal_params

      expect(response).to redirect_to job_application_job_proposal_path(job_proposal)
      expect(job_proposal.reload.status).to eq('rejected')
      expect(flash[:notice]).to be_present
    end
  end
end
