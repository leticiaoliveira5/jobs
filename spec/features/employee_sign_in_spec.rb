require 'rails_helper'

feature 'Employee sign in' do

  scenario 'successfully and registers company' do

    visit root_path
    click_on 'Área da empresa'
    click_on 'Cadastre-se'
    fill_in 'Nome', with: 'Steve'
    fill_in 'Sobrenome', with: 'Jobs'
    fill_in 'Email', with: 'steve@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('steve@apple.com')
    expect(page).to have_content('Welcome! You have signed up successfully')
    expect(page).to have_content('Domínio: apple.com')
    expect(page).to have_field('(Admin)')
    expect(page).to have_field('Nome')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')

  end

  scenario 'and belongs to company' do

    company = Company.create!(name: 'Apple', domain:'apple.com', city: 'Los Angeles', state: 'California')

    employee = Employee.create!(email: 'steve@apple.com',
                                password: '123456',
                                firstname: 'Steve', 
                                surname:'Jobs')

    visit root_path
    click_on 'Área da empresa'
    click_on 'Cadastre-se'
    fill_in 'Nome', with: 'Ronald'
    fill_in 'Sobrenome', with: 'Wayne'
    fill_in 'Email', with: 'ronald@apple.com'
    fill_in 'Senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('ronald@apple.com')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Domínio: apple.com')

  end

  scenario 'and log out' do

    employee = Employee.create!(email: 'leticia@email.com',
                                password: '123456',
                                firstname: 'leticia', 
                                surname:'oliveira')

    visit root_path
    click_on 'Entrar'
    within('form') do
    fill_in 'E-mail', with: 'leticia@email.com'
    fill_in 'Senha', with: '123456'
    click_on 'Fazer login'
    end
    click_on 'Sair'

    expect(page).not_to have_content employee.email
    expect(page).not_to have_link 'Sair'
    expect(page).to have_link 'Entrar'

  end


end
