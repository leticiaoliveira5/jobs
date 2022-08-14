# rails generate rspec:controller candidates
require 'rails_helper'

RSpec.describe CandidatesController, type: :controller do

  describe "#index" do
    let(:candidate) { create(:candidate) }

    it 'redirects to log in page if candidate not logged in' do
      get :index

      expect(response).to redirect_to(new_candidate_session_path)
    end

    it 'renders template if candidate is logged in' do
      sign_in(candidate)
      get :index

      expect(response).to render_template('index')
    end
  end
end
