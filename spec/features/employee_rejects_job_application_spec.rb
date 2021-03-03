require 'rails_helper'

feature 'Employee rejects job application' do

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
                                    address: 'Brasil',
                                    about_me: 'testando')

        job_application = JobApplication.create!(candidate: candidate, 
                            job_opportunity: job_opportunity,
                            status:0)

        login_as apple_employee

        visit root_path
        click_on 'Área da empresa'
        click_on 'Rejeitar candidatura de Juliette'

        expect(current_path).to eq job_application_path(job_application)
        expect(page).to have_field 'rejection_motive'

    end

end