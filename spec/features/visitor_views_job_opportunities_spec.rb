require 'rails_helper'

feature 'Visitor views job opportunities' do

  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Jobs')
    expect(page).to have_content('Sua carreira começa aqui')
    expect(page).to have_link('Entrar')
    expect(page).to have_link('Cadastre-se')
    expect(page).to have_link('Ver empresas cadastradas')

  end

  scenario 'and views registered companies' do

    Company.create!(name: 'Apple', 
                    domain:'apple.com', 
                    address: 'Los Angeles', 
                    cnpj: '123456789')
    
    Company.create!(name: 'Microsoft', 
                    domain:'microsoft.com', 
                    address: 'Los Angeles', 
                    cnpj: '987654321')

    visit root_path
    click_on 'Ver empresas cadastradas'

    expect(page).to have_link('Apple')
    expect(page).to have_link('Microsoft')

  end

  scenario 'and clicks to apply' do

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