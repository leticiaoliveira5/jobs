require 'rails_helper'

feature 'Employee views job proposals sent' do

    scenario 'successfully' do
        apple_employee = Employee.create!(email: 'steve@apple.com',
        password: '123456', firstname: 'Steve', surname:'Jobs')
        apple = apple_employee.company
        apple.update(name:'Apple', address: 'San Francisco', cnpj: '123456789')

        job_opportunity = JobOpportunity.create!(company: apple, 
            job_title: 'Desenvolvedor',
            job_level: 'Nível superior', 
            salary_range: 'Inbox',
            description: 'Uma boa oportunidade',
            place: 'home office',        
            limit_date: '26/10/2021',
            number_of_positions: '5')

        candidate = Candidate.create(email: 'juliette@gmail.com', password: '123456', 
                                    firstname: 'Juliette', surname: 'Freire')

        job_application = JobApplication.create!(candidate: candidate, 
                                job_opportunity: job_opportunity,
                                status:0)
        JobProposal.create!(job_application: job_application, 
                            message:'mensagem teste',
                            salary_proposal:'15000',
                            start_date: '01/01/2022',
                            candidate:candidate)  
                            
        login_as apple_employee, scope: :employee
        visit root_path
        click_on 'Área da empresa'
        expect(page).to have_content 'Propostas enviadas'
        expect(page).to have_link 'Desenvolvedor - Juliette Freire'
    end

end