# rails generate rspec:controller candidates
require 'rails_helper'

RSpec.describe CandidatesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }

  describe '#index' do
    it 'redirects to log in page if candidate not logged in' do
      get :index

      expect(response).to redirect_to(new_candidate_session_path)
    end

    it 'renders template if candidate is logged in', candidate_signed_in: true do
      get :index

      expect(response).to render_template('index')
    end
  end
end
