require 'rails_helper'

feature 'Employee sign in' do
  scenario 'successfully and company is created' do
    visit root_path
    within('.dropdown-signin') do
      click_on 'Empresa'
    end
    fill_in 'Nome', with: 'Steve'
    fill_in 'Sobrenome', with: 'Jobs'
    fill_in 'E-mail', with: 'steve@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('steve@apple.com')
    expect(page).to have_text('Bem vindo! Você realizou seu registro com sucesso.')
    expect(page).to have_text('Cadastro de empresa')
    expect(page).to have_field('Nome') &&  have_field('Endereço') && have_field('CNPJ')
    expect(Company.count).to eq(1)
  end

  scenario 'if company already exists' do
    apple = create(:company, name: 'Apple', domain: 'apple.com', address: 'Los Angeles')

    visit root_path
    within('.dropdown-signin') do
      click_on 'Empresa'
    end
    fill_in 'Nome', with: 'Ronald'
    fill_in 'Sobrenome', with: 'Wayne'
    fill_in 'E-mail', with: 'ronald@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'

    new_employee = Employee.last
    expect(page).to have_content('Apple')
    expect(new_employee.company).to eq apple
  end

  scenario 'and log out' do
    employee = create(:employee, email: 'leticia@email.com', password: '123456')

    visit root_path
    within('.dropdown-login') do
      click_on 'Empresa'
    end
    within('form') do
      fill_in 'E-mail', with: 'leticia@email.com'
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end
    click_on 'Sair'

    expect(page).not_to have_content employee.email
    expect(page).not_to have_link 'Sair'
  end
end
