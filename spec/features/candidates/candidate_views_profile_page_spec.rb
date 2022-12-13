require 'rails_helper'

feature 'Candidate views profile page' do
  let(:candidate) { create(:candidate) }

  before do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Meu perfil'
  end

  scenario 'with candidates basic info' do
    expect(current_path).to eq("/u/#{candidate.id}")
    expect(page).to have_content(candidate.full_name)
    expect(page).to have_content(candidate.about_me)
  end

  scenario 'with candidates details' do
    expect(page).to have_content 'Experiência profissional'
    expect(page).to have_content 'Formação Acadêmica'
    expect(page).to have_content 'Habilidades'
    expect(page).to have_content 'Cursos e Certificados'
    expect(page).to have_content 'Línguas'
  end
end
