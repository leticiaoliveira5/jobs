require 'rails_helper'

feature 'Employee sign in' do

  scenario 'successfully and registers company' do

    visit root_path
    within('.signin') do
    click_on 'Empresa'
    end
    fill_in 'Firstname', with: 'Steve'
    fill_in 'Surname', with: 'Jobs'
    fill_in 'Email', with: 'steve@apple.com'
    fill_in 'Password', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('steve@apple.com')
    expect(page).to have_content('Welcome! You have signed up successfully')
    expect(page).to have_text('Cadastro de empresa')
    expect(page).to have_field('Name')
    expect(page).to have_field('City')
    expect(page).to have_field('State')

  end

  scenario 'and belongs to company' do

    company = Company.create!(name: 'Apple', domain:'apple.com', city: 'Los Angeles', state: 'California')

    employee = Employee.create!(email: 'steve@apple.com',
                                password: '123456',
                                firstname: 'Steve', 
                                surname:'Jobs')

    visit root_path
    within('.signin') do
      click_on 'Empresa'
      end
    fill_in 'Firstname', with: 'Ronald'
    fill_in 'Surname', with: 'Wayne'
    fill_in 'Email', with: 'ronald@apple.com'
    fill_in 'Password', with: '123456'
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
    within('.login') do
      click_on 'Empresa'
    end
    within('form') do
    fill_in 'Email', with: 'leticia@email.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    end
    click_on 'Sair'

    expect(page).not_to have_content employee.email
    expect(page).not_to have_link 'Sair'

  end


end
