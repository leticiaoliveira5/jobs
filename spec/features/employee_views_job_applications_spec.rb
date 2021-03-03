require 'rails_helper'

feature 'Employee views job applications received' do
    
    scenario 'successfully' do

        apple_employee = Employee.create!(email: 'steve@apple.com',
                password: '123456',firstname: 'Steve', surname:'Jobs')
        apple = Company.find_by(domain:'apple.com')
        apple.update(name: 'Apple', address: 'San Francisco', cnpj: '12345678911234')

        job_opportunity = JobOpportunity.create!(company: apple, 
        job_title: 'Desenvolvedor',
        job_level: 'Nível superior', 
        salary_range: 'Inbox',
        description: 'Uma boa oportunidade',
        place: 'home office',
        limit_date: '26/10/2021',
        number_of_positions: '5')

        candidate = Candidate.create(email: 'juliette@gmail.com',
                                    password: '123456', 
                                    firstname: 'Juliette', 
                                    surname: 'Freire',
                                    cpf: '123456789',
                                    address: 'Brasil')

        JobApplication.create!(candidate: candidate, 
                            job_opportunity: job_opportunity,
                            status:0)

        login_as apple_employee

        visit root_path
        click_on 'Área da empresa'
        click_on 'Desenvolvedor'

        expect(page).to have_content 'Candidaturas recebidas para esta vaga:'
        expect(page).to have_content 'Desenvolvedor - Juliette Freire'

    end

    scenario 'only if belongs to company' do

        apple_employee = Employee.create!(email: 'steve@apple.com',
        password: '123456',firstname: 'Steve', surname:'Jobs')
        apple = apple_employee.company
        apple.update(name:'Apple', address: 'San Francisco', cnpj: '12345678911234')

        microsoft_employee = Employee.create!(email: 'bill@microsoft.com',
        password: '123456', firstname: 'Bill', surname:'Gates')
        microsoft = microsoft_employee.company 
        microsoft.update(name: 'Microsoft', address: 'San Francisco', cnpj: '12345678911235')

        job_opportunity = JobOpportunity.create!(company: apple, 
        job_title: 'Desenvolvedor',
        job_level: 'Nível superior', 
        salary_range: 'Inbox',
        description: 'Uma boa oportunidade',
        place: 'home office',        
        limit_date: '26/10/2021',
        number_of_positions: '5')

        candidate = Candidate.create(email: 'juliette@gmail.com',
                                    password: '123456', 
                                    firstname: 'Juliette', 
                                    surname: 'Freire',
                                    cpf: '123456789',
                                    address: 'Brasil')

        JobApplication.create!(candidate: candidate, 
        job_opportunity: job_opportunity,
        status: 0)

        login_as microsoft_employee

        visit root_path
        click_on 'Ver empresas cadastradas'
        click_on 'Apple'
        click_on 'Desenvolvedor'
        
        expect(page).not_to have_content 'Candidaturas recebidas para esta vaga:'
        expect(page).not_to have_link 'Inativar vaga'

    end

end