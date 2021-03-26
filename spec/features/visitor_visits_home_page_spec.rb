# frozen_string_literal: true

require 'rails_helper'

feature 'Visitor visits home page' do
  scenario 'successfully' do
    # act
    visit root_path
    # assert
    expect(page).to have_content('Jobs')
    expect(page).to have_content('Sua carreira começa aqui')
    expect(page).to have_button('Entrar')
    expect(page).to have_button('Cadastre-se')
    expect(page).to have_button('Ver empresas cadastradas')
  end

  scenario 'and views registered companies' do
    # arrange
    create(:company, name: 'Apple', domain: 'apple.com')
    create(:company, name: 'Microsoft', domain: 'microsoft.com', cnpj: '12345678911235')
    # act
    visit root_path
    click_on 'Ver empresas cadastradas'
    # assert
    expect(page).to have_link('Apple')
    expect(page).to have_link('Microsoft')
  end
end
