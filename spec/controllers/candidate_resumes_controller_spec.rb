require 'rails_helper'

RSpec.describe CandidateResumesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }
  let(:resume) { candidate.resume }

  describe '#show' do
    context 'when candidate is signed in' do
      it 'renders template show', candidate_signed_in: true do
        get :show

        expect(response).to render_template('show')
        expect(assigns(:resume)).to eq resume
      end
    end
  end

  describe '#edit', candidate_signed_in: true do
    it 'renders template edit' do
      get :edit

      expect(response).to render_template('edit')
      expect(assigns(:resume)).to eq resume
    end
  end

  describe '#update', candidate_signed_in: true do
    it 'updates resume and redirects to show' do
      patch :update, params: { id: resume.id, resume: { address: 'Paraíba' } }

      expect(resume.reload.address).to eq 'Paraíba'
      expect(response).to redirect_to resume_path
      expect(flash[:notice]).to be_present
    end
  end
end
