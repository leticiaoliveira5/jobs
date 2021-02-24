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

        visit root_path
        within('.login') do 
            click_on 'Candidato'
        end
        fill_in 'E-mail', with: 'karol@k.com'
        fill_in 'Senha', with: '123456'
        click_on 'Log in'
        click_on 'Ver empresas cadastradas'
        click_on 'Globo'
        click_on 'Dummie'
        click_on 'Inscrever-se nesta vaga'

        expect(page).to have_text 'Inscrição realizada com sucesso!'
        expect(page).not_to have_link 'Inscrever-se nesta vaga'

    end

    scenario 'only once' do

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

        visit root_path
        within('.login') do 
            click_on 'Candidato'
        end
        fill_in 'E-mail', with: 'karol@k.com'
        fill_in 'Senha', with: '123456'
        click_on 'Log in'
        click_on 'Ver empresas cadastradas'
        click_on 'Globo'
        click_on 'Dummie'
        click_on 'Inscrever-se nesta vaga'
        click_on 'Inscrever-se nesta vaga'

        expect(JobApplication.count).to eq(1)
        expect(page).to have_text 'Você já se inscreveu nesta vaga'
    
    end

end