require 'rails_helper'

feature 'Employee views job applications received' do
    
    scenario 'successfully' do

        apple = Company.create!(name: 'Apple', 
        domain:'apple.com', 
        address: 'Los Angeles', 
        cnpj: '123456789')

        apple_employee = Employee.create!(email: 'steve@apple.com',
        password: '123456',
        firstname: 'Steve', 
        surname:'Jobs',
        role: 'admin',
        company: apple)

        job_opportunity = JobOpportunity.create!(company: apple, 
        job_title: 'Desenvolvedor',
        job_level: 'Nível superior', 
        salary_range: 'Inbox',
        description: 'Uma boa oportunidade',
        place: 'home office',
        number_of_positions: '5')

        candidate = Candidate.create(email: 'juliette@gmail.com', password: '123456', firstname: 'Juliette', surname: 'Freire')

        JobApplication.create!(candidate: candidate, job_opportunity: job_opportunity)

        login_as apple_employee

        visit root_path
        click_on 'Área da empresa'
        click_on 'Desenvolvedor'

        expect(page).to have_content 'Candidaturas recebidas para esta vaga:'
        expect(page).to have_content 'Desenvolvedor - Juliette Freire'

    end

    scenario 'only if belongs to company' do

        apple = Company.create!(name: 'Apple', 
        domain:'apple.com', 
        address: 'Los Angeles', 
        cnpj: '123456789')

        microsoft = Company.create!(name: 'Microsoft', 
        domain:'microsoft.com', 
        address: 'Los Angeles', 
        cnpj: '987654321')

        microsoft_employee = Employee.create!(email: 'bill@microsoft.com',
        password: '123456',
        firstname: 'Bill', 
        surname:'Gates',
        role: 'admin',
        company: microsoft)

        job_opportunity = JobOpportunity.create!(company: apple, 
        job_title: 'Desenvolvedor',
        job_level: 'Nível superior', 
        salary_range: 'Inbox',
        description: 'Uma boa oportunidade',
        place: 'home office',
        number_of_positions: '5')

        candidate = Candidate.create(email: 'juliette@gmail.com', password: '123456', firstname: 'Juliette', surname: 'Freire')

        JobApplication.create!(candidate: candidate, job_opportunity: job_opportunity)

        login_as microsoft_employee

        visit root_path
        click_on 'Ver empresas cadastradas'
        click_on 'Apple'
        click_on 'Desenvolvedor'
        
        expect(page).not_to have_content 'Candidaturas recebidas para esta vaga:'
        expect(page).not_to have_link 'Inativar vaga'

    end

end