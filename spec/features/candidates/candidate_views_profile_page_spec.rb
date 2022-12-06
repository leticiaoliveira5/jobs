require 'rails_helper'

feature 'Candidate views profile page' do
  let(:candidate) { create(:candidate) }

  before do
    create(:work_experience, candidate: candidate)
    create(:candidate_skill, candidate: candidate)
    create(:course, candidate: candidate)
  end

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Meu perfil'

    expect(page).to have_content 'Dados Pessoais'
    expect(page).to have_content 'Experiência profissional'
    expect(page).to have_content 'Habilidades'
    expect(page).to have_content 'Cursos e Certificados'
  end
end
