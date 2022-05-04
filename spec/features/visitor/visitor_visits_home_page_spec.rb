require 'rails_helper'

feature 'Visitor visits home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Jobs') && have_content('Sua carreira começa aqui')
    expect(page).to have_button('Entrar') && have_button('Cadastre-se')
    within('.nav') do
      expect(page).to have_link('Ver empresas cadastradas')
      expect(page).to have_link('Vagas recentes')
    end
  end

  scenario 'and views registered companies' do
    create(:company, name: 'Apple', domain: 'apple.com')
    create(:company, name: 'Microsoft', domain: 'microsoft.com', cnpj: '12345678911235')

    visit root_path
    click_on 'Ver empresas cadastradas'

    expect(page).to have_link('Apple')
    expect(page).to have_link('Microsoft')
  end
end
