require 'rails_helper'

RSpec.describe ResumesController, type: :controller do
  let(:candidate) { create(:candidate) }
  let(:resume) { candidate.resume }

  describe '#show' do
    context 'when candidate is signed in' do
      before do
        sign_in(candidate)
        get :show, params: { id: resume.id }
      end

      it 'renders template show' do
        expect(response).to render_template('show')
        expect(assigns(:resume)).to eq resume
      end
    end

    context 'when candidate or employee is not signed in' do
      it 'redirects to home page' do
        get :show, params: { id: resume.id }

        expect(response).to redirect_to root_path
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe '#edit' do
    before do
      sign_in(candidate)
      get :edit, params: { id: resume.id }
    end

    it 'renders template edit' do
      expect(response).to render_template('edit')
      expect(assigns(:resume)).to eq resume
    end
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
