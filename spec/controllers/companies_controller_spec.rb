require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let(:company) { create(:company) }

  describe '#show' do
    it_behaves_like 'controller simple get action',
                    object: 'company', action: 'show', template: 'show'
  end

  describe '#index' do
    it_behaves_like 'controller simple get action',
                    object: 'company', action: 'index', template: 'index'
  end

  describe '#edit' do
    it_behaves_like 'controller simple get action',
                    object: 'company', action: 'edit', template: 'edit'
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

    it 'with invalis params, renders edit' do
      patch :update, params: { id: company.id, company: { address: '' } }

      expect(response).to render_template('edit')
      expect(company.reload.address).to eq 'California'
    end
  end
end
