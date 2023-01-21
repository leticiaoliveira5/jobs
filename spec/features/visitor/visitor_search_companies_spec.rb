require 'rails_helper'

feature 'Visitor searches job opportunities' do
  before do
    create(:company, name: 'Apple', address: 'California')
    visit root_path
    click_on 'Empresas'
  end

  scenario 'successfully' do
    fill_in :search_input, with: 'app'
    page.find('button[type="submit"]').click

    expect(current_path).to eq(companies_path)
    expect(page).to have_content 'Resultado da Busca'
    expect(page).to have_link 'Apple'
  end

  scenario 'by company address' do
    fill_in :search_input, with: 'California'
    page.find('button[type="submit"]').click

    expect(current_path).to eq(companies_path)
    expect(page).to have_link 'Apple'
  end
end
