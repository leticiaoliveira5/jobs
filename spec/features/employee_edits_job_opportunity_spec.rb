require 'rails_helper'

feature 'employee edits job opportunity' do

    scenario 'successfully' do

        employee = Employee.create!(email: 'faustao@globo.com',
                                    password: '123456',
                                    firstname: 'Fausto', 
                                    surname:'Silva')

        company = Company.find_by(domain: 'globo.com')
        company.update(name: 'Globo', domain:'globo.com', 
        address: 'Rio de Janeiro', cnpj: '12345678911234')

        job_opportunity = JobOpportunity.create!(company: company, 
        job_title: 'Dummie',
        job_level: 'Pleno', 
        salary_range: 'Salário mínimo',
        description: 'Auxiliar em diversas atividades',
        place: 'Curicica - RJ',        
        limit_date: '26/10/2021',
        number_of_positions: '10')

        login_as employee, scope: :employee
        
        visit root_path
        click_on 'Área da empresa'
        click_on 'Dummie'
        click_on 'Editar vaga'
        fill_in 'Descrição', with: 'Auxiliar em diversas atividades, como: organização de provas e simulações'
        fill_in 'Data limite', with: '26/12/2021'
        click_on 'Atualizar'

        expect(current_path).to eq job_opportunity_path(job_opportunity)
        expect(page).to have_content 'Globo'
        expect(page).to have_content 'Auxiliar em diversas atividades, como: organização de provas e simulações'

    end

end