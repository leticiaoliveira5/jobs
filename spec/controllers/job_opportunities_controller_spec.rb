require 'rails_helper'

RSpec.describe JobOpportunitiesController, type: :controller, login_metadata: true do
  let(:employee) { create(:employee) }
  let(:job_opportunity) { create(:job_opportunity, company: employee.company) }

  describe '#index' do
    it_behaves_like 'controller simple get action',
                    object: 'job_opportunity', action: 'index', template: 'index'
  end

  describe '#new', employee_signed_in: true do
    it 'renders new' do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe '#show' do
    it_behaves_like 'controller simple get action',
                    object: 'job_opportunity', action: 'show', template: 'show'
  end

  describe '#edit', employee_signed_in: true do
    it 'renders template edit' do
      get :edit, params: { id: job_opportunity.id }

      expect(response).to render_template('edit')
      expect(assigns(:job_opportunity)).to eq job_opportunity
    end
  end

  describe '#create', employee_signed_in: true do
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

  describe '#update', employee_signed_in: true do
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

  describe '#create_job_application', candidate_signed_in: true do
    let(:candidate) { create(:candidate) }

    context 'success' do
      it 'creates job application' do
        expect do
          post :create_job_application, params: { id: job_opportunity.id }
        end.to change(JobApplication, :count).by(1)

        expect(response).to redirect_to(job_application_path(JobApplication.last))
        expect(assigns(:job_opportunity)).to eq job_opportunity
        expect(flash[:notice]).to be_present
      end
    end

    context 'when candidate information is missing' do
      let(:candidate) { create(:candidate, :without_info) }

      it 'fails', candidate_signed_in: true do
        expect do
          post :create_job_application, params: { id: job_opportunity.id }
        end.not_to change(JobApplication, :count)

        expect(response).to redirect_to(job_opportunity_path(job_opportunity))
        expect(assigns(:job_opportunity)).to eq job_opportunity
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe '#inactivate_job_opportunity', employee_signed_in: true do
    it 'updates status and redirects' do
      post :inactivate_job_opportunity, params: { id: job_opportunity.id }

      expect(response).to redirect_to job_opportunity_path(job_opportunity)
      expect(job_opportunity.reload.status).to eq('inactive')
    end
  end

  describe '#activate_job_opportunity', employee_signed_in: true do
    let(:job_opportunity) { create(:job_opportunity, status: :inactive, company: employee.company) }

    it 'updates status and redirects' do
      post :activate_job_opportunity, params: { id: job_opportunity.id }

      expect(response).to redirect_to job_opportunity_path(job_opportunity)
      expect(job_opportunity.reload.status).to eq('active')
    end
  end
end
