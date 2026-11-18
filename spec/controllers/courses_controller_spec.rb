require 'rails_helper'

RSpec.describe CoursesController, login_metadata: true, type: :controller do
  let(:candidate) { create(:candidate) }

  describe '#create' do
    it_behaves_like 'candidate profile create', object: 'course',
                                                params: { course: { title: 'Teste' } }
  end

  describe '#destroy' do
    it_behaves_like 'candidate profile destroy', object: 'course'
  end
end
