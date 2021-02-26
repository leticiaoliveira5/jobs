require 'rails_helper'

feature 'Visitor searches job opportunitiees' do

    scenario 'successfully' do 

        apple_employee = Employee.create!(email: 'steve@apple.com',
                password: '123456',firstname: 'Steve', surname:'Jobs')
        apple = Company.find_by(domain:'apple.com')
        apple.update(name:'Apple', address: 'San Francisco', cnpj: '123456789')

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