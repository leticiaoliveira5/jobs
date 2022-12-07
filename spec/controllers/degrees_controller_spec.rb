require 'rails_helper'

RSpec.describe DegreesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }

  describe '#create' do
    it_behaves_like 'candidate profile create', object: 'degree',
                                                params: { degree: { title: 'English',
                                                                    type: :graduate } }
  end

  describe '#destroy' do
    it_behaves_like 'candidate profile destroy', object: 'degree'
  end
end
