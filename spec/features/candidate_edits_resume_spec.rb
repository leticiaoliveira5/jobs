require 'rails_helper'

feature 'candidate edits resume' do
  scenario 'successfully' do
    candidate = create(:candidate)
    resume = candidate.resume

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Meu currículo'
    click_on 'Editar currículo'
    fill_in 'Formação acadêmica', with: 'Segundo grau'
    click_on 'Atualizar currículo'

    expect(current_path).to eq resume_path(candidate.resume)
    expect(page).to have_content 'Currículo atualizado com sucesso'
    expect(page).to have_content 'Segundo grau'
    expect(resume.reload.education).to eq 'Segundo grau'
  end
end
