require 'rails_helper'

feature 'Visitor views job opportunities' do

  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Jobs')
    expect(page).to have_content('Sua carreira começa aqui')
  end

  scenario 'and clicks to apply' do

    company = Company.create!(name: 'Apple', domain:'apple.com', city: 'Los Angeles', state: 'California')
    company = Company.create!(name: 'Microsoft', domain:'microsoft.com', city: 'Los Angeles', state: 'California')

    visit root_path
    click_on 'Ver empresas cadastradas'

    expect(page).to have_link('Apple')
    expect(page).to have_link('Microsoft')

  end


end