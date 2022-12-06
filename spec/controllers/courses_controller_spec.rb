require 'rails_helper'

RSpec.describe CoursesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }

  describe '#create' do
    it_behaves_like 'candidate profile create', object: 'course',
                                                params: { course: { title: 'Teste' } }
  end

  describe '#destroy' do
    it_behaves_like 'candidate profile destroy', object: 'course'
  end
end
