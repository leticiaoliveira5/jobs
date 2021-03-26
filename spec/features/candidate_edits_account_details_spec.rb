# frozen_string_literal: true

require 'rails_helper'

feature 'candidate edits account details' do
  scenario 'successfully' do
    visit root_path
    within('.dropdown-signin') do
      click_on 'Candidato'
    end
    fill_in 'Nome', with: 'Maria'
    fill_in 'Sobrenome', with: 'Pereira'
    fill_in 'E-mail', with: 'mariap@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'
    click_on 'Área do candidato'
    click_on 'Editar dados da minha conta'
    fill_in 'About me', with: 'Olá, meu nome é Maria'
    fill_in 'Current password', with: '123456'
    click_on 'Update'

    expect(Candidate.first.about_me).to eq('Olá, meu nome é Maria')
  end
end
