require 'rails_helper'

feature 'Employee sign in' do

  scenario 'successfully and company is created' do

    visit root_path
    within('.signin') do
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
    expect(page).to have_field('Nome')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('CNPJ')
    expect(Company.count).to eq(1)

  end

  scenario 'and belongs to company' do

   employee = Employee.create!(email: 'steve@apple.com', password: '123456', 
    firstname: 'Steve', surname:'Jobs')
    company = Company.find_by(domain: 'apple.com')
    company.update(name: 'Apple', address: 'Los Angeles', cnpj: '12345678911234')

    visit root_path
    within('.signin') do
    click_on 'Empresa'
    end
    fill_in 'Nome', with: 'Ronald'
    fill_in 'Sobrenome', with: 'Wayne'
    fill_in 'E-mail', with: 'ronald@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('ronald@apple.com')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Los Angeles')

  end

  scenario 'and log out' do

    employee = Employee.create!(email: 'leticia@email.com',
                                password: '123456',
                                firstname: 'leticia', 
                                surname:'oliveira')

    visit root_path
    within('.login') do
      click_on 'Empresa'
    end
    within('form') do
    fill_in 'E-mail', with: 'leticia@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    end
    click_on 'Sair'
    
    expect(Company.count).to eq(1)
    expect(page).not_to have_content employee.email
    expect(page).not_to have_link 'Sair'

  end


end
