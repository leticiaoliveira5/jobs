require 'rails_helper'

feature 'Employee sign in for the first time with existing company' do
  before do
    create(:company, :with_employee, name: 'Apple', domain: 'apple.com')
    visit root_path
    within('#employee-form') { click_on 'Inscrever-se' }
    fill_in 'Nome', with: 'Steve'
    fill_in 'Sobrenome', with: 'Jobs'
    fill_in 'E-mail', with: 'steve@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'
  end

  scenario 'and views company dashboard' do
    company = Company.last
    expect(company.employees.count).to eq 2
    expect(current_path).to eq company_path(company)
    expect(page).to have_content('steve@apple.com')
    expect(page).to have_text('Bem vindo! Você realizou seu registro com sucesso.')
  end
end
