require 'rails_helper'

feature 'Visitor vies registered companies' do
  before do
    create(:company, name: 'Apple', domain: 'apple.com')
    create(:company, name: 'Microsoft', domain: 'microsoft.com', document: '12345678911235')
  end

  scenario 'successfully' do
    visit root_path
    click_on 'Empresas'

    expect(page).to have_link('Apple')
    expect(page).to have_link('Microsoft')
  end
end
