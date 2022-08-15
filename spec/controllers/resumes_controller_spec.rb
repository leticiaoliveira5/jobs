require 'rails_helper'

RSpec.describe ResumesController, type: :controller do
  let(:candidate) { create(:candidate) }
  let(:resume) { candidate.resume }

  before do |test|
    sign_in(candidate) unless test.metadata[:logged_out]
  end

  describe '#show' do
    context 'when candidate is signed in' do
      it 'renders template show' do
        get :show, params: { id: resume.id }

        expect(response).to render_template('show')
        expect(assigns(:resume)).to eq resume
      end
    end

    context 'when candidate or employee is not signed in' do
      it 'redirects to home page', logged_out: true do
        get :show, params: { id: resume.id }

        expect(response).to redirect_to root_path
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe '#edit' do
    it 'renders template edit' do
      get :edit, params: { id: resume.id }

      expect(response).to render_template('edit')
      expect(assigns(:resume)).to eq resume
    end
  end

  describe '#update' do
    it 'updates resume and redirects to show' do
      patch :update, params: { id: resume.id, resume: { address: 'Paraíba' } }

      expect(resume.reload.address).to eq 'Paraíba'
      expect(response).to redirect_to resume_path(resume)
      expect(flash[:notice]).to be_present
    end
  end
end
