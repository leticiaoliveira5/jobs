require 'rails_helper'

feature 'Resume update' do
  let!(:candidate) { create(:candidate) }
  let(:resume) { candidate.resume }

  scenario 'Candidate is not logged in' do
    when_visitor_tries_to_access_resume
    should_be_redirected_to_home_page_with_a_note
  end

  scenario 'Candidate updates resume' do
    candidate_is_logged_in_on_home_page
    clicks_on_edit_resume
    page_has_resume_fields
    page_has_update_button_and_return_link
    fills_in_form_and_clicks_on_update
    they_see_the_updated_resume
    success_message_is_rendered
  end

  def candidate_is_logged_in_on_home_page
    login_as candidate, scope: :candidate
    visit root_path
  end

  def clicks_on_edit_resume
    click_on 'Meu currículo'
    click_on 'Editar currículo'
  end

  def fills_in_form_and_clicks_on_update
    fill_in 'Formação acadêmica', with: 'Segundo grau'
    click_on 'Atualizar currículo'
  end

  def when_visitor_tries_to_access_resume
    visit resume_path(candidate.resume)
  end

  def should_be_redirected_to_home_page_with_a_note
    expect(current_path).to eq root_path
    expect(page).to have_text 'Você não tem permissão para ver esta página'
  end

  def they_see_the_updated_resume
    expect(current_path).to eq resume_path(candidate.resume)
    expect(page).to have_text 'Segundo grau'
    expect(resume.reload.education).to eq 'Segundo grau'
  end

  def success_message_is_rendered
    expect(page).to have_text 'Currículo atualizado com sucesso'
  end

  def page_has_resume_fields
    expect(page).to have_field(['Formação acadêmica', 'Experiência profissional', 'Idiomas',
                                'Conhecimentos', 'Conhecimentos', 'Cursos'])
  end

  def page_has_update_button_and_return_link
    expect(page).to have_button('Atualizar currículo') && have_link('Voltar')
  end
end
