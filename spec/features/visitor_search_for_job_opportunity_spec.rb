# frozen_string_literal: true

require 'rails_helper'

feature 'Visitor searches job opportunities' do
  scenario 'successfully' do
    apple_employee = Employee.create!(email: 'steve@apple.com',
                                      password: '123456', firstname: 'Steve', surname: 'Jobs')
    apple = Company.find_by(domain: 'apple.com')
    apple.update(name: 'Apple', address: 'San Francisco', cnpj: '12345678911234')

    job_opportunity = JobOpportunity.create!(company: apple,
                                             job_title: 'Desenvolvedor',
                                             job_level: 'Pleno',
                                             salary_range: 'Inbox',
                                             description: 'Uma boa oportunidade',
                                             place: 'home office',
                                             limit_date: '26/10/2021',
                                             number_of_positions: '5')

    visit root_path
    fill_in 'Busca por empresa ou vaga', with: 'desenvolvedor'
    click_on 'Buscar'

    expect(current_path).to eq(search_results_path)
    expect(page).to have_link 'Desenvolvedor'
    expect(page).to have_link 'Apple'
  end

  scenario 'by company name' do
    apple_employee = Employee.create!(email: 'steve@apple.com',
                                      password: '123456', firstname: 'Steve', surname: 'Jobs')
    apple = Company.find_by(domain: 'apple.com')
    apple.update(name: 'Apple', address: 'San Francisco', cnpj: '12345678911234')

    job_opportunity = JobOpportunity.create!(company: apple,
                                             job_title: 'Desenvolvedor',
                                             job_level: 'Pleno',
                                             salary_range: 'Inbox',
                                             description: 'Uma boa oportunidade',
                                             place: 'home office',
                                             limit_date: '26/10/2021',
                                             number_of_positions: '5')

    visit root_path
    fill_in 'Busca por empresa ou vaga', with: 'Apple'
    click_on 'Buscar'

    expect(current_path).to eq(search_results_path)
    expect(page).to have_link 'Desenvolvedor'
    expect(page).to have_link 'Apple'
  end
end
