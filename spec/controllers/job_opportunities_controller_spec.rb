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

    it { expect(response).to render_template('edit') }
    it { expect(assigns(:job_opportunity)).to eq job_opportunity }
  end

  describe '#create' do
    it 'with valid params, creates job_opportunity' do
      sign_in(employee)

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

    it 'with invalis params, renders new' do
      sign_in(employee)

      post :create, params: { job_opportunity: { job_title: 'Cantor' } }

      expect(response).to render_template('new')
    end
  end
end
