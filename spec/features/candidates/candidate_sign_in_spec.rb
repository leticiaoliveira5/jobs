require 'rails_helper'

feature 'Candidate sign up' do
  scenario 'successfully' do
    visit root_path
    within('#candidate-form') do
      click_on 'Inscrever-se'
    end
    fill_in 'Nome', with: 'Maria'
    fill_in 'Sobrenome', with: 'Pereira'
    fill_in 'E-mail', with: 'mariap@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
  end
end
