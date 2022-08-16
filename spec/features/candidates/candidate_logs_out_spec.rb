require 'rails_helper'

feature 'Candidate logs out' do
  let(:candidate) { create(:candidate) }

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit candidates_path(candidate)
    within('.nav') { click_on('Sair') }

    expect(current_path).to eq root_path
  end
end
