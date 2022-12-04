require 'rails_helper'

feature 'Candidate displays skills on profile page' do
  let(:candidate) { create(:candidate) }

  before do
    create(:candidate_skill, candidate: candidate, name: 'Violino', level: :advanced)
  end

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Meu perfil'

    expect(page).to have_content 'Violino'
    expect(page).to have_content 'Avançado'
  end
end
