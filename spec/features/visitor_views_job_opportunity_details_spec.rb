require 'rails_helper'

feature 'Visitor views job opportunity details' do

  scenario 'successfully' do

    apple_employee = Employee.create!(email: 'steve@apple.com',
    password: '123456',firstname: 'Steve', surname:'Jobs')
    apple = Company.find_by(domain:'apple.com')
    apple.update(name:'Apple', address: 'San Francisco', cnpj: '123456789')

    microsoft_employee = Employee.create!(email: 'bill@microsoft.com',
    password: '123456', firstname: 'Bill', surname:'Gates')
    microsoft = Company.find_by(domain: 'microsoft.com')
    microsoft.update(name: 'Microsoft', address: 'San Francisco', cnpj: '987654321')

    JobOpportunity.create!(company: apple, 
    job_title: 'Desenvolvedor',
    job_level: 'Nível superior', 
    salary_range: 'Inbox',
    description: 'Uma boa oportunidade',
    place: 'Home Office',
    limit_date: '26/10/2021',
    number_of_positions: '5')

    visit root_path
    click_on 'Desenvolvedor'
    
    expect(page).to have_content('Desenvolvedor')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Nível superior')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Home Office')  

  end

  scenario 'and clicks to apply' do

    apple_employee = Employee.create!(email: 'steve@apple.com',
    password: '123456',firstname: 'Steve', surname:'Jobs')
    apple = Company.find_by(domain:'apple.com')
    apple.update(name:'Apple', address: 'San Francisco', cnpj: '123456789')
    
    JobOpportunity.create!(company: apple, 
    job_title: 'Desenvolvedor',
    job_level: 'Nível superior', 
    salary_range: 'Inbox',
    description: 'Uma boa oportunidade',
    place: 'home office',
    limit_date: '26/10/2021',
    number_of_positions: 5)

    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'
    click_on 'Desenvolvedor'
    click_on 'Inscrever-se nesta vaga'

    expect(current_path).to eq(new_candidate_session_path)
    expect(page).to have_text('Você precisa registrar-se para continuar')

  end

  scenario 'only if job opportunity is active' do

    apple_employee = Employee.create!(email: 'steve@apple.com',
    password: '123456',firstname: 'Steve', surname:'Jobs')
    apple = Company.find_by(domain:'apple.com')
    apple.update(name:'Apple', address: 'San Francisco', cnpj: '123456789')
    
    job_opportunity = JobOpportunity.create!(company: apple, 
    job_title: 'Desenvolvedor',
    job_level: 'Nível superior', 
    salary_range: 'Inbox',
    description: 'Uma boa oportunidade',
    place: 'home office',
    limit_date: '26/10/2021',
    number_of_positions: 5)

    job_opportunity.inactive!

    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'
  
    expect(current_path).to eq(company_path(apple))
    expect(page).not_to have_content('Desenvolvedor')

  end


end