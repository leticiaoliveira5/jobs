require 'rails_helper'

feature 'Candidate views profile page' do
  let(:candidate) { create(:candidate) }

  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Meu perfil'

    expect(page).to have_content 'Dados Pessoais'
    expect(page).to have_content 'Experiência Profissional'
    expect(page).to have_content 'Habilidades'
  end
end
