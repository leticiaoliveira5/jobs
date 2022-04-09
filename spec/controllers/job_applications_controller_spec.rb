require 'rails_helper'

RSpec.describe JobApplicationsController, type: :controller do
  let!(:job_application) { create(:job_application) }

  describe '#show' do
    context '' do
      it do
        get :show, params: { id: job_application.id }

        expect(response).to render_template('show')
      end
    end
  end
end
