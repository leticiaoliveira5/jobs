require 'rails_helper'

feature 'Visitor views job opportunity details' do

  scenario 'successfully' do

    apple = Company.create!(name: 'Apple', 
    domain:'apple.com', 
    address: 'Los Angeles', 
    cnpj: '123456789')

    microsoft = Company.create!(name: 'Microsoft', 
      domain:'microsoft.com', 
      address: 'Los Angeles', 
      cnpj: '987654321')

    JobOpportunity.create!(company: apple, 
    job_title: 'Desenvolvedor',
    job_level: 'Nível superior', 
    salary_range: 'Inbox',
    description: 'Uma boa oportunidade',
    place: 'Home Office',
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

    apple = Company.create!(name: 'Apple', 
                    domain:'apple.com', 
                    address: 'Los Angeles', 
                    cnpj: '123456789')
    
    JobOpportunity.create!(company: apple, 
    job_title: 'Desenvolvedor',
    job_level: 'Nível superior', 
    salary_range: 'Inbox',
    description: 'Uma boa oportunidade',
    place: 'home office',
    number_of_positions: '5')

    visit root_path
    click_on 'Ver empresas cadastradas'
    click_on 'Apple'
    click_on 'Desenvolvedor'
    click_on 'Inscrever-se nesta vaga'

    expect(current_path).to eq(new_candidate_session_path)

  end


end