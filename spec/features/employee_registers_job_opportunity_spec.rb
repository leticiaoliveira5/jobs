require 'rails_helper'

feature 'employee registers job opportunity' do

    scenario 'successfully' do

        employee = Employee.create!(email: 'faustao@globo.com',
                                    password: '123456',
                                    firstname: 'Fausto', 
                                    surname:'Silva')

        company = Company.find_by(domain: 'globo.com')
        company.update(name: 'Globo', domain:'globo.com', 
        address: 'Rio de Janeiro', cnpj: '12345678911234')
        
        login_as employee, scope: :employee
        
        visit root_path
        click_on 'Área da empresa'
        click_on 'Cadastrar nova vaga'
        fill_in 'Título da vaga', with: 'Ator'
        fill_in 'Faixa salarial', with: 'A combinar'
        fill_in 'Nível de escolaridade', with: 'Nível médio'
        fill_in 'Local', with: 'Curicica, Rio de Janeiro'
        fill_in 'Descrição', with: 'Atuar em novelas da emissora.'
        fill_in 'Data limite', with: '26/10/2021'
        fill_in 'Número de vagas', with: '2'
        click_on 'Cadastrar vaga'

        expect(page).to have_content 'Globo'
        expect(page).to have_content 'Descrição'
        expect(page).to have_content 'Atuar em novelas da emissora'
        expect(company.job_opportunities.count).to eq(1)

    end

    scenario 'only if belongs to company' do
        
        company_employee = Employee.create!(email: 'faustao@globo.com',
        password: '123456',
        firstname: 'Fausto', 
        surname:'Silva')
        company = Company.find_by(domain:'globo.com')
        company.update(name: 'Globo', domain:'globo.com', 
                        address: 'Rio de Janeiro', cnpj: '12345678911234')

        another_company_employee = Employee.create!(email: 'rodrigo@record.com',
                                                    password: '123456',
                                                    firstname: 'Rodrigo', 
                                                    surname:'Faro')
        another_company = Company.find_by(domain: 'record.com')
        another_company.update(name: 'Record',
                                    address: 'Rio de Janeiro', 
                                    cnpj: '12345678911235')
        
        login_as company_employee, scope: :employee
        visit root_path
        click_on 'Ver empresas cadastradas'
        click_on 'Record'

        expect(page).not_to have_content 'Registrar nova vaga'
        expect(page).not_to have_content 'Editar dados da empresa'
        expect(page).not_to have_content 'Painel do colaborador'

    end

    scenario 'only if all fields are filled' do

        company_employee = Employee.create!(email: 'faustao@globo.com',
        password: '123456',
        firstname: 'Fausto', 
        surname:'Silva')
        company = Company.find_by(domain: 'globo.com')
        company = Company.update(name: 'Globo', 
        address: 'Rio de Janeiro', cnpj: '12345678911234')

        login_as company_employee, scope: :employee
        visit root_path
        click_on 'Área da empresa'
        click_on 'Cadastrar nova vaga'
        fill_in 'Título da vaga', with: 'Atriz'
        click_on 'Cadastrar vaga'

        expect(JobOpportunity.count).to eq(0)
        expect(page).to have_content 'Descrição não pode ficar em branco'
        expect(page).to have_content 'Nível de escolaridade não pode ficar em branco'
        expect(page).to have_content 'Faixa salarial não pode ficar em branco'
        expect(page).to have_content 'Local não pode ficar em branco'
        expect(page).to have_content 'Data limite não pode ficar em branco'


    end

end