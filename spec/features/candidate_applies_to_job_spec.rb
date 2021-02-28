require 'rails_helper'

feature 'Candidate applies to job' do

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
        limit_date: '26/10/2021',
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
        expect(JobApplication.count).to eq(1)

    end

    scenario 'only once' do

        employee = Employee.create!(email: 'faustao@globo.com',
                                    password: '123456',
                                    firstname: 'Fausto', 
                                    surname:'Silva')

        company = Company.find_by(domain:'globo.com')
        company.update(name: 'Globo', domain:'globo.com', 
        address: 'Rio de Janeiro', cnpj: '12346')

        job_opportunity = JobOpportunity.create!(company: company, 
        job_title: 'Dummie',
        job_level: 'Nível médio', 
        salary_range: 'Salário mínimo',
        description: 'Auxiliar em diversas atividades',
        place: 'Curicica - RJ',
        limit_date: '26/10/2021', 
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

    scenario 'and cancels application' do

        employee = Employee.create!(email: 'faustao@globo.com',
        password: '123456',
        firstname: 'Fausto', 
        surname:'Silva')

        company = Company.find_by(domain:'globo.com')
        company.update(name: 'Globo', domain:'globo.com', 
        address: 'Rio de Janeiro', cnpj: '12346')

        job_opportunity = JobOpportunity.create!(company: company, 
        job_title: 'Dummie',
        job_level: 'Nível médio', 
        salary_range: 'Salário mínimo',
        description: 'Auxiliar em diversas atividades',
        place: 'Curicica - RJ',        
        limit_date: '26/10/2021',
        number_of_positions: '10')

        candidate = Candidate.create(email: 'karol@k.com', 
        password: '123456', 
        firstname: 'Karoline', 
        surname: 'dos Santos')

        login_as candidate, scope: :candidate
        visit root_path
        click_on 'Dummie'
        click_on 'Inscrever-se nesta vaga'
        click_on 'Área do candidato'
        click_on 'Cancelar candidatura'

        expect(candidate.job_applications.count).to eq(0)
        expect(page).to have_text 'Você não está mais inscrito nesta vaga'

    end

end