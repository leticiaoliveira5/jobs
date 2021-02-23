require 'rails_helper'

feature 'Candidate applies to job' do

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

        candidate = Candidate.create(email: 'karol@k.com', 
        password: '123456', 
        firstname: 'Karoline', 
        surname: 'dos Santos')

        resume = Resume.create!(candidate: candidate)

        visit root_path
        within('.login') do 
            click_on 'Candidato'
        end
        fill_in 'email', with: 'karol@k.com'
        fill_in 'password', with: '123456'
        click_on 'Login'
        click_on 'Ver empresas cadastradas'
        click_on 'Globo'
        click_on 'Dummie'
        click_on 'Inscrever-se nesta vaga'

        expect(page).to have_content 'Você está concorrendo a esta vaga'

    end

        scenario 'only if resume is complete' do


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

        candidate = Candidate.create(email: 'karol@k.com', 
        password: '123456', 
        firstname: 'Karoline', 
        surname: 'dos Santos')

        resume = Resume.create!(candidate: candidate)

        visit root_path
        within('.login') do 
        click_on 'Candidato'
        end
        fill_in 'email', with: 'karol@k.com'
        fill_in 'password', with: '123456'
        click_on 'Login'
        click_on 'Ver empresas cadastradas'
        click_on 'Globo'
        click_on 'Dummie'
        click_on 'Inscrever-se nesta vaga'

        expect(page).to have_content 'Você está concorrendo a esta vaga'
        expect(JobApplications.count).to eq(0)


        end


end