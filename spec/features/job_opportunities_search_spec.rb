require 'rails_helper'

feature 'Visitor searches job opportunitiees' do

    scenario 'successfully' do 

        apple = Company.create!(name: 'Apple', 
        domain:'apple.com', 
        address: 'Los Angeles', 
        cnpj: '123456789')

        apple_employee = Employee.create!(email: 'steve@apple.com',
        password: '123456',
        firstname: 'Steve', 
        surname:'Jobs',
        role: 'admin',
        company: apple)

        job_opportunity = JobOpportunity.create!(company: apple, 
        job_title: 'Desenvolvedor',
        job_level: 'Nível superior', 
        salary_range: 'Inbox',
        description: 'Uma boa oportunidade',
        place: 'home office',
        number_of_positions: '5')

        visit root_path
        fill_in 'Search', with: 'desenvolvedor'

        #expect(current_path).to eq(search_path)
        expect(page).to have_link 'Desenvolvedor - Apple'


    end

end