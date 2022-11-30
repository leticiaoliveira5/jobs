require 'rails_helper'

RSpec.describe CandidatesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }

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
end
