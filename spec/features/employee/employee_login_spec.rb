require 'rails_helper'

feature 'Employee logs in' do
  let(:employee) { create(:employee, email: 'leticia@email.com', password: '123456') }

  before do
    visit root_path
    within('.dropdown-login') { click_on 'Empresa' }
    within('form') do
      fill_in 'E-mail', with: employee.email
      fill_in 'Senha', with: employee.password
      click_on 'Log in'
    end
  end

  scenario 'successfully' do
    expect(current_path).to eq company_path(employee.company)
    within('.nav') do
      expect(page).to have_content 'leticia@email.com'
      expect(page).to have_link 'Sair'
    end
  end

  scenario 'and logs out' do
    click_on 'Sair'

    expect(page).not_to have_content 'leticia@email.com'
    expect(page).not_to have_link 'Sair'
  end
end
