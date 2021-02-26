require 'rails_helper'

feature 'Visitor visits home page' do

  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Jobs')
    expect(page).to have_content('Sua carreira começa aqui')
    expect(page).to have_button('Entrar')
    expect(page).to have_button('Cadastre-se')
    expect(page).to have_button('Ver empresas cadastradas')
  end

  scenario 'and views registered companies' do

    apple_employee = Employee.create!(email: 'steve@apple.com',
    password: '123456',firstname: 'Steve', surname:'Jobs')
    apple = Company.where(domain:'apple.com')
    apple.update(name:'Apple', address: 'San Francisco', cnpj: '123456789')

    microsoft_employee = Employee.create!(email: 'bill@microsoft.com',
    password: '123456', firstname: 'Bill', surname:'Gates')
    microsoft = Company.where(domain: 'microsoft.com')
    microsoft.update(name: 'Microsoft', address: 'San Francisco', cnpj: '987654321')

    visit root_path
    click_on 'Ver empresas cadastradas'

    expect(page).to have_link('Apple')
    expect(page).to have_link('Microsoft')

  end


end
