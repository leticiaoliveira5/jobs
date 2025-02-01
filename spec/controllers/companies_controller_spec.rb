require 'rails_helper'

RSpec.describe CompaniesController, type: :controller, login_metadata: true do
  let(:company) { create(:company, :with_employee) }
  let(:employee) { company.employees.first }

  describe '#show' do
    it_behaves_like 'controller simple get action',
                    object: 'company', action: 'show', template: 'show'
  end

  describe '#index' do
    it_behaves_like 'controller simple get action',
                    object: 'company', action: 'index', template: 'index'
  end

  describe '#edit' do
    context 'with company employee signed in', employee_signed_in: true do
      it 'render edit' do
        get :edit

        expect(response).to render_template('edit')
      end
    end
  end

  describe '#create' do
    it 'creates a company' do
      expect do
        post :create, params: { company: { name: 'Apple', domain: 'apple.com' } }
      end.to change(Company, :count).by(1)

      expect(response).to redirect_to(company_path(Company.last))
    end
  end

  describe '#update' do
    let(:company) { create(:company, :with_employee) }

    before { sign_in(company.employees.first) }

    it 'with valid params, updates company' do
      patch :update, params: { id: company.id, company: { domain: 'company.com' } }

      expect(response).to redirect_to(company_path(company))
      expect(company.reload.domain).to eq 'company.com'
    end

    it 'with invalid params, renders edit' do
      patch :update, params: { id: company.id, company: { domain: '' } }

      expect(response).to render_template('edit')
      expect(company.reload.domain).not_to eq 'company.com'
    end
  end

  describe '#dashboard' do
    it 'renders company dashboard', employee_signed_in: true do
      get :dashboard

      expect(response).to render_template('dashboard')
    end
  end
end
