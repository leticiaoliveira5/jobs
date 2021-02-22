require 'rails_helper'

feature 'Visitor visits home page' do


  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Jobs')
    expect(page).to have_content('Sua carreira começa aqui')
  end

  scenario 'and views registered companies' do

    company = Company.create!(name: 'Apple', domain:'apple.com', address: 'Los Angeles', cnpj: '123')
    company = Company.create!(name: 'Microsoft', domain:'microsoft.com', address: 'Los Angeles', cnpj: '123')

    visit root_path
    click_on 'Ver empresas cadastradas'

    expect(page).to have_link('Apple')
    expect(page).to have_link('Microsoft')

  end


end
