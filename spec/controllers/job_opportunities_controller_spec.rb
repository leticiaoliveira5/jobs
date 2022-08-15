require 'rails_helper'

RSpec.describe JobOpportunitiesController, type: :controller do
  let(:employee) { create(:employee) }
  let(:job_opportunity) { create(:job_opportunity, company: employee.company) }

  describe '#index' do
    it_behaves_like 'controller simple get action',
                    object: 'job_opportunity', action: 'index', template: 'index'
  end

  describe '#new' do
    before do
      sign_in(employee)
      get :new
    end

    it { expect(response).to render_template('new') }
  end

  describe '#show' do
    it_behaves_like 'controller simple get action',
                    object: 'job_opportunity', action: 'show', template: 'show'
  end

  describe '#edit' do
    before do
      sign_in(employee)
      get :edit, params: { id: job_opportunity.id }
    end

    it 'renders template edit' do
      expect(response).to render_template('edit')
      expect(assigns(:job_opportunity)).to eq job_opportunity
    end
  end

  describe '#create' do
    before { sign_in(employee) }

    it 'with valid params, creates job_opportunity' do
      expect do
        post :create, params: { job_opportunity: { job_title: 'Cantor',
                                                   description: 'Descrição teste',
                                                   job_level: '1',
                                                   salary_range: '200',
                                                   place: 'Location',
                                                   limit_date: 6.months.from_now,
                                                   number_of_positions: 2 } }
      end.to change(JobOpportunity, :count).by(1)

      expect(response).to redirect_to(job_opportunity_path(JobOpportunity.last))
    end

    it 'with invalid params, renders new' do
      post :create, params: { job_opportunity: { job_title: 'Cantor' } }

      expect(response).to render_template('new')
    end
  end

  describe '#update' do
    before { sign_in(employee) }

    it 'with valid params, updates job_opportunity' do
      patch :update, params: { id: job_opportunity.id, job_opportunity: { job_title: 'Officer' } }

      expect(response).to redirect_to(job_opportunity_path(job_opportunity))
      expect(job_opportunity.reload.job_title).to eq 'Officer'
    end

    it 'with invalid params, renders edit' do
      patch :update, params: { id: job_opportunity.id, job_opportunity: { job_title: '' } }

      expect(response).to render_template('edit')
    end
  end

  describe '#create_job_application' do
    let(:candidate) { create(:candidate) }

    before { sign_in(candidate) }

    context 'success' do
      it 'creates job application' do
        expect do
          post :create_job_application, params: { id: job_opportunity.id }
        end.to change(JobApplication, :count).by(1)

        expect(response).to redirect_to(redirect_to(job_application_path(JobApplication.last)))
        expect(assigns(:job_opportunity)).to eq job_opportunity
        expect(flash[:notice]).to be_present
      end
    end

    context 'when candidate information is missing' do
      let(:candidate) { create(:candidate, :without_info) }

      it 'fails' do
        expect do
          post :create_job_application, params: { id: job_opportunity.id }
        end.not_to change(JobApplication, :count)

        expect(response).to redirect_to(redirect_to(job_opportunity_path(job_opportunity)))
        expect(assigns(:job_opportunity)).to eq job_opportunity
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe '#inactivate_job_opportunity' do
    before do
      sign_in(employee)
      post :inactivate_job_opportunity, params: { id: job_opportunity.id }
    end

    it 'updates status and redirects' do
      expect(response).to redirect_to job_opportunity_path(job_opportunity)
      expect(job_opportunity.reload.status).to eq('inactive')
    end
  end

  describe '#activate_job_opportunity' do
    let(:job_opportunity) { create(:job_opportunity, status: :inactive, company: employee.company) }

    before do
      sign_in(employee)
      post :activate_job_opportunity, params: { id: job_opportunity.id }
    end

    it 'updates status and redirects' do
      expect(response).to redirect_to job_opportunity_path(job_opportunity)
      expect(job_opportunity.reload.status).to eq('active')
    end
  end
end
