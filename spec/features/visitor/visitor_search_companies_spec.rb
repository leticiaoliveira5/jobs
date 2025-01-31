require 'rails_helper'

feature 'Visitor searches job opportunities' do
  before do
    create(:company, name: 'Apple', domain: 'jobs.com')
    visit root_path
    within('.nav') { click_on 'Empresas' }
  end

  scenario 'by name' do
    fill_in :search_input, with: 'app'
    expect_to_find_company
  end

  scenario 'by address' do
    fill_in :search_input, with: 'California'
    expect_to_find_company
  end

  scenario 'by domain' do
    fill_in :search_input, with: 'jobs'
    expect_to_find_company
  end

  def expect_to_find_company
    page.find('button[type="submit"]').click
    expect(current_path).to eq(companies_path)
    expect(page).to have_content('Resultado da Busca') && have_link('Apple')
  end
end
