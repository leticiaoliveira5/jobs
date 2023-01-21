require 'rails_helper'

RSpec.describe WorkExperiencesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }

  describe '#create' do
    it_behaves_like 'candidate profile create', object: 'work_experience',
                                                params: { work_experience: {
                                                  job_title: 'Title Test',
                                                  start_date: 2.months.ago,
                                                  company_name: 'Company Name'
                                                } }
  end

  describe '#destroy' do
    it_behaves_like 'candidate profile destroy', object: 'work_experience'
  end
end
