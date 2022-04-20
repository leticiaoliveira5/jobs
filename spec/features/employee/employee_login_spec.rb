require 'rails_helper'

feature 'Employee logs in' do
  before do
    create(:employee, email: 'leticia@email.com', password: '123456')
    visit root_path
    within('.dropdown-login') { click_on 'Empresa' }
    within('form') do
      fill_in 'E-mail', with: 'leticia@email.com'
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end
  end

  scenario 'successfully' do
    expect(page).to have_content 'leticia@email.com'
    expect(page).to have_link 'Sair'
  end

  scenario 'and logs out' do
    click_on 'Sair'

    expect(page).not_to have_content 'leticia@email.com'
    expect(page).not_to have_link 'Sair'
  end
end
