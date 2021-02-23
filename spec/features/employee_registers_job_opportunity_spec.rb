require 'rails_helper'

feature 'employee registers job opportunity' do

    scenario 'successfully' do

        company = Company.create!(name: 'Globo', 
                                    domain:'globo.com', 
                                    address: 'Rio de Janeiro', 
                                    cnpj: '12346')
        employee = Employee.create!(email: 'faustao@globo.com',
                                    password: '123456',
                                    firstname: 'Fausto', 
                                    surname:'Silva',
                                    role: 'admin')
        
        login_as employee, scope: :employee
        
        visit root_path
        click_on 'Área da empresa'
        click_on 'Cadastrar nova vaga'
        fill_in 'Título da vaga', with: 'Ator'
        fill_in 'Faixa salarial', with: 'A combinar'
        fill_in 'Nível de escolaridade', with: 'Nível médio'
        fill_in 'Place', with: 'Curicica, Rio de Janeiro'
        fill_in 'Descrição', with: 'Atuar em novelas da emissora.'
        click_on 'Submit'

        expect(page).to have_content 'Ator - Globo'
        expect(page).to have_content 'Descrição'
        expect(company.job_opportunities.count).to eq '1'

    end

    scenario 'only if belongs to company' do
        
        company = Company.create!(name: 'Globo', 
                                domain:'globo.com', 
                                address: 'Rio de Janeiro', 
                                cnpj: '12346')

        company_employee = Employee.create!(email: 'faustao@globo.com',
        password: '123456',
        firstname: 'Fausto', 
        surname:'Silva',
        role: 'regular',
        company: company)

        another_company = Company.create!(name: 'Record', 
                                    domain:'r7.com', 
                                    address: 'Rio de Janeiro', 
                                    cnpj: '1230')

        

        login_as company_employee, scope: :employee

        visit root_path
        click_on 'Ver empresas cadastradas'
        click_on 'Record'

        expect(page).not_to have_content 'Registrar nova vaga'
        expect(page).not_to have_content 'Editar dados da empresa'
        expect(page).not_to have_content 'Painel do colaborador'

    end

    scenario 'only if all fields are filled' do

        company = Company.create!(name: 'Globo', 
        domain:'globo.com', 
        address: 'Rio de Janeiro', 
        cnpj: '1234678910')

        company_employee = Employee.create!(email: 'faustao@globo.com',
        password: '123456',
        firstname: 'Fausto', 
        surname:'Silva',
        role: 'admin')

        login_as company_employee, scope: :employee

        visit root_path
        click_on 'Área da empresa'
        click_on 'Cadastrar nova vaga'
        fill_in 'Jobtitle', with: 'Atriz'
        click_on 'Submit'

        expect(page).to have_content 'Não pode ficar em branco'
        expect(JobOpportunity.count).to eq(0)

    end

end