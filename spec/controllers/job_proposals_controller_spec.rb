require 'rails_helper'

RSpec.describe JobProposalsController, type: :controller do
  let(:job_proposal) { create(:job_proposal) }
  let(:candidate) { job_proposal.candidate }
  let(:job_application) { job_proposal.job_application }
  let(:employee) { create(:employee, company: job_application.company) }

  describe '#show' do
    before do
      sign_in(candidate)
      get :show, params: { id: job_proposal.id, job_application_id: job_application.id }
    end

    it { expect(response).to render_template('show') }
  end

  describe '#new' do
    before do
      sign_in(employee)
      get :new, params: { id: job_proposal.id, job_application_id: job_application.id }
    end

    it { expect(response).to render_template('new') }
  end

  describe '#create' do
    before { sign_in(employee) }

    context 'with valid params' do
      it 'creates job proposal and redirects to company dashboard' do
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

  describe '#accept' do
    before do
      sign_in(candidate)
      post :accept, params: { id: job_proposal.id, job_application_id: job_application.id }
    end

    it { expect(response).to redirect_to job_application_job_proposal_path(job_proposal) }
    it { expect(job_proposal.reload.status).to eq('accepted') }
    it { expect(flash[:notice]).to be_present }
  end

  describe '#reject' do
    before do
      sign_in(candidate)
      post :reject, params: { id: job_proposal.id, job_application_id: job_application.id }
    end

    it { expect(response).to redirect_to job_application_job_proposal_path(job_proposal) }
    it { expect(job_proposal.reload.status).to eq('rejected') }
    it { expect(flash[:notice]).to be_present }
  end
end
