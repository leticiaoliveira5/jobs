# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate sign up' do
  scenario 'successfully' do
    # act
    visit root_path
    within('.dropdown-signin') do
      click_on 'Candidato'
    end
    fill_in 'Nome', with: 'Maria'
    fill_in 'Sobrenome', with: 'Pereira'
    fill_in 'E-mail', with: 'mariap@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'
    # assert
    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
  end
end
