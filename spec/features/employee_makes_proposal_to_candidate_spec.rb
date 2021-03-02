require 'rails_helper'

feature 'Employee makes proposal to candidate' do

    scenario 'successfully' do

        apple_employee = Employee.create!(email: 'steve@apple.com',
        password: '123456', firstname: 'Steve', surname:'Jobs')
        apple = apple_employee.company
        apple.update(name:'Apple', address: 'San Francisco', cnpj: '12345678911234')

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

        JobApplication.create!(candidate: candidate, 
                                job_opportunity: job_opportunity,
                                status:0)

        login_as apple_employee

        visit root_path
        click_on 'Área da empresa'
        click_on 'Desenvolvedor'
        click_on 'Fazer proposta para Juliette'
        fill_in 'Mensagem', with: 'Mensagem teste'
        fill_in 'Proposta salarial', with: '2500'
        fill_in 'Data de início', with: '25/04/2021'
        click_on 'Enviar'

        expect(JobProposal.count).to eq(1)
        expect(page).to have_content 'A proposta foi enviada para o candidato'

    end

end