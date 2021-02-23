require 'rails_helper'

feature 'Candidate sign in and fills resume' do

    scenario 'successfully' do

        company = Company.create!(name: 'Globo', 
                                    domain:'globo.com', 
                                    address: 'Rio de Janeiro', 
                                    cnpj: '12346')

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
        fill_in 'Firstname', with: 'Maria'
        fill_in 'Surname', with: 'Pereira'
        fill_in 'email', with: 'mariap@email.com'
        fill_in 'password', with: '123456'
        click_on 'Sign in'

        expect(page).to have_content 'Preencha seu currículo'
        expect(page).to have_content 'Atenção: você deve preencher todo o currículo antes de se candidatar para uma vaga'
        expect(page).to have_field 'Idiomas'
        expect(page).to have_field 'Conhecimentos'
        expect(page).to have_field 'Formação'
        expect(page).to have_button 'Atualizar currículo'

    end

end