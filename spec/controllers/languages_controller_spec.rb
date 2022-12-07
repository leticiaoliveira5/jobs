require 'rails_helper'

RSpec.describe LanguagesController, type: :controller, login_metadata: true do
  let(:candidate) { create(:candidate) }

  describe '#create' do
    it_behaves_like 'candidate profile create', object: 'language',
                                                params: { language: { name: 'English',
                                                                      proficiency: :advanced } }
  end

  describe '#destroy' do
    it_behaves_like 'candidate profile destroy', object: 'language'
  end
end
