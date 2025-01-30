require 'rails_helper'

RSpec.describe CandidatesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }
  let(:employee) { create(:employee) }

  describe '#dashboard' do
    it 'redirects to log in page if candidate not logged in' do
      get :dashboard

      expect(response).to redirect_to(new_candidate_session_path)
    end

    it 'renders template if candidate is logged in', candidate_signed_in: true do
      get :dashboard

      expect(response).to render_template('dashboard')
    end
  end

  describe '#index' do
    it 'when no user signed in, redirects to login page' do
      get :index

      expect(response).to redirect_to root_path
    end

    it 'when employee signed in, renders candidates page', employee_signed_in: true do
      get :index

      expect(response).to render_template('index')
    end

    it 'when candidate signed in, renders candidates page', candidate_signed_in: true do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe '#show' do
    it 'when no user signed in, redirects to login page' do
      get :show, params: { id: candidate.id }

      expect(response).to redirect_to root_path
    end

    it 'when candidate signed in, renders candidate page', candidate_signed_in: true do
      get :show, params: { id: candidate.id }

      expect(response).to render_template('show')
    end

    it 'when employee signed in, renders candidate page', employee_signed_in: true do
      get :show, params: { id: candidate.id }

      expect(response).to render_template('show')
    end
  end
end
