require 'rails_helper'

feature 'Visitor searches job opportunities' do
  before do
    create(:company, name: 'Apple', address: 'California', domain: 'jobs.com')
    visit root_path
    click_on 'Empresas'
  end

  scenario 'by name' do
    fill_in :search_input, with: 'app'
    page.find('button[type="submit"]').click
  end

  scenario 'by address' do
    fill_in :search_input, with: 'California'
    page.find('button[type="submit"]').click
  end

  scenario 'by domain' do
    fill_in :search_input, with: 'jobs'
    page.find('button[type="submit"]').click
  end

  after(:each) do
    expect(current_path).to eq(companies_path)
    expect(page).to have_content 'Resultado da Busca'
    expect(page).to have_link 'Apple'
  end
end
