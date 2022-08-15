require 'rails_helper'

RSpec.describe JobOpportunitiesController, type: :controller do
  let(:employee) { create(:employee) }
  let(:job_opportunity) { create(:job_opportunity, company: employee.company) }

  describe '#show' do
    it_behaves_like 'controller simple get action',
                    object: 'job_opportunity', action: 'show', template: 'show'
  end

  describe '#index' do
    it_behaves_like 'controller simple get action',
                    object: 'job_opportunity', action: 'index', template: 'index'
  end

  describe '#edit' do
    before do
      sign_in(employee)
      get :edit, params: { id: job_opportunity.id }
    end

    it { expect(response).to render_template('edit') }
    it { expect(assigns(:job_opportunity)).to eq job_opportunity }
  end

  describe '#new' do
    before do
      sign_in(employee)
      get :new
    end

    it { expect(response).to render_template('new') }
  end
end
