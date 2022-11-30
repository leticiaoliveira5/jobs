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
        get :edit, params: { id: company.id }

        expect(response).to render_template('edit')
      end
    end

    context 'when employee is not from the company' do
      it 'renderirects with alert' do
        other_company_employee = create(:employee)
        sign_in(other_company_employee)

        get :edit, params: { id: company.id }

        expect(response).to redirect_to(company_path(other_company_employee.company))
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe '#create' do
    it 'creates a company' do
      expect do
        post :create, params: { company: { name: 'Apple', domain: 'apple.com', address: 'CA' } }
      end.to change(Company, :count).by(1)

      expect(response).to redirect_to(company_path(Company.last))
    end
  end

  describe '#update' do
    let(:company) { create(:company, address: 'California') }

    it 'with valid params, updates company' do
      patch :update, params: { id: company.id, company: { address: 'New York' } }

      expect(response).to redirect_to(company_path(company))
      expect(company.reload.address).to eq 'New York'
    end

    it 'with invalid params, renders edit' do
      patch :update, params: { id: company.id, company: { address: '' } }

      expect(response).to render_template('edit')
      expect(company.reload.address).to eq 'California'
    end
  end

  describe '#company_dashboard' do
    it 'renders company dashboard', employee_signed_in: true do
      get '/company_dashboard'

      expect(response).to render_template('company_dashboard')
    end
  end
end
