require 'rails_helper'

feature 'First employee sign in for the first time' do
  before do
    visit root_path
    within('#employee-form') { click_on 'Inscrever-se' }
    fill_in 'Nome', with: 'Steve'
    fill_in 'Sobrenome', with: 'Jobs'
    fill_in 'E-mail', with: 'steve@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'
  end

  let(:company) { Employee.find_by(email: 'steve@apple.com').company }

  scenario 'and company is created' do
    expect(Company.count).to eq(1)
    expect(current_path).to eq '/company/edit_info'
    expect(page).to have_content('steve@apple.com')
    expect(page).to have_text('Bem vindo! Você realizou seu registro com sucesso.') &&
                    have_text('Cadastro de empresa')
  end

  scenario 'and registers company' do
    fill_in 'Nome', with: 'Apple'
    fill_in 'CNPJ', with: '12345678912345'
    fill_in 'Endereço', with: 'California'
    click_on 'Cadastrar empresa'

    expect(company.reload.name).to eq 'Apple'
    expect(company.reload.document).to eq('12345678912345')
  end
end
