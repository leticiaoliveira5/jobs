require 'rails_helper'

feature 'employee registers job opportunity' do

    scenario 'successfully' do

        company = Company.create!(name: 'Globo', 
                                    domain:'globo.com', 
                                    city: 'Rio de Janeiro', 
                                    state: 'RJ')
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

    #scenario 'only if belongs to company' do

       

    #end

    #scenario 'only if all fields are filled' do

       

    #end

end