require 'rails_helper'

feature 'candidate views resume edit form' do
  let(:candidate) { create(:candidate) }
  scenario 'successfully' do
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Meu currículo'
    click_on 'Editar currículo'

    expect(page).to have_field 'Formação acadêmica'
    expect(page).to have_field 'Experiência profissional'
    expect(page).to have_field 'Idiomas'
    expect(page).to have_field 'Conhecimentos'
    expect(page).to have_field 'Cursos'
    expect(page).to have_button 'Atualizar currículo'
    expect(page).to have_link 'Voltar'
  end

  scenario 'is not logged in' do
    visit resume_path(candidate.resume)

    expect(current_path).to eq root_path
    expect(page).to have_text 'Você não tem permissão para ver esta página'
  end
end
