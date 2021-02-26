require 'rails_helper'

feature 'Candidate sign up and fills resume' do

    scenario 'successfully' do

        employee = Employee.create!(email: 'faustao@globo.com',
                                    password: '123456',
                                    firstname: 'Fausto', 
                                    surname:'Silva')

        company = Company.find_by(domain: 'globo.com')
        company.update(name: 'Globo', domain:'globo.com', 
        address: 'Rio de Janeiro', cnpj: '12346')

        job_opportunity = JobOpportunity.create!(company: company, 
        job_title: 'Dummie',
        job_level: 'Nível médio', 
        salary_range: 'Salário mínimo',
        description: 'Auxiliar em diversas atividades',
        place: 'Curicica - RJ',
        number_of_positions: '10')

        visit root_path
        within('.signin') do 
            click_on 'Candidato'
        end
        fill_in 'Nome', with: 'Maria'
        fill_in 'Sobrenome', with: 'Pereira'
        fill_in 'E-mail', with: 'mariap@email.com'
        fill_in 'Senha', with: '123456'
        click_on 'Sign up'

        expect(page).to have_content 'Preencha seu currículo'
        expect(page).to have_content 'Atenção: você deve preencher todo o currículo antes de se candidatar para uma vaga'
        expect(page).to have_field 'Idiomas'
        expect(page).to have_field 'Conhecimentos'
        expect(page).to have_field 'Formação'
        expect(page).to have_button 'Atualizar currículo'

    end

end