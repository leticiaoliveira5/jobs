require 'rails_helper'

RSpec.describe ResumesController, type: :controller do
  let(:candidate) { create(:candidate) }
  let(:resume) { candidate.resume }

  describe '#show' do
    before do
      sign_in(candidate)
      get :show, params: { id: resume.id }
    end

    it { expect(response).to render_template('show') }
    it { expect(assigns(:resume)).to eq resume }
  end

  describe '#edit' do
    before do
      sign_in(candidate)
      get :edit, params: { id: resume.id }
    end

    it { expect(response).to render_template('edit') }
    it { expect(assigns(:resume)).to eq resume }
  end

  describe '#update' do
    before do
      sign_in(candidate)
      patch :update, params: { id: resume.id, resume: { address: 'Paraíba' } }
    end

    it 'updates resume and rediects to show' do
      expect(resume.reload.address).to eq 'Paraíba'
      expect(response).to redirect_to resume_path(resume)
      expect(flash[:notice]).to be_present
    end
  end
end
