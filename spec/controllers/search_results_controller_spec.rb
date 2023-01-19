require 'rails_helper'

RSpec.describe SearchResultsController, type: :controller, login_metadata: true do
  describe '#index' do
    it 'renders results' do
      get :index, params: { search_input: '' }

      expect(response).to render_template('index')
    end
  end
end
