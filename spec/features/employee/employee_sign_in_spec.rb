require 'rails_helper'

feature 'Employee sign in' do
  before do
    visit root_path
    within('.dropdown-signin') { click_on 'Empresa' }
  end

  scenario 'and registers company' do
    fill_in 'Nome', with: 'Steve'
    fill_in 'Sobrenome', with: 'Jobs'
    fill_in 'E-mail', with: 'steve@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'

    company = Employee.find_by(email: 'steve@apple.com').company

    expect(Company.count).to eq(1)
    expect(current_path).to eq edit_company_path(company)
    expect(page).to have_content('steve@apple.com')
    expect(page).to have_text('Bem vindo! Você realizou seu registro com sucesso.') &&
                    have_text('Cadastro de empresa')

    fill_in 'Nome', with: 'Apple'
    fill_in 'CNPJ', with: '12345678912345'
    fill_in 'Endereço', with: 'California'
    click_on 'Cadastrar empresa'

    expect(company.reload.name).to eq 'Apple'
    expect(company.reload.cnpj).to eq(12345678912345)
  end

  scenario 'if company already exists' do
    apple = create(:company, name: 'Apple', domain: 'apple.com', address: 'Los Angeles')

    fill_in 'Nome', with: 'Ronald'
    fill_in 'Sobrenome', with: 'Wayne'
    fill_in 'E-mail', with: 'ronald@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('Apple')
    expect(Employee.last.company).to eq apple
  end
end
