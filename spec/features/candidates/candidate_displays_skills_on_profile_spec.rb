require 'rails_helper'

feature 'Candidate displays skills on profile page' do
  let(:candidate) { create(:candidate) }

  before do
    skill = create(:skill, name: 'Violino')
    create(:candidate_skill, candidate: candidate, skill: skill, level: :advanced)
  end

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    within('.nav') do
      click_on 'Meu perfil'
    end

    expect(page).to have_content 'Violino'
    expect(page).to have_content 'Avançado'
  end
end
