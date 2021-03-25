# frozen_string_literal: true

require 'rails_helper'

feature 'Candidate views job proposals' do
  scenario 'successfully' do
    apple_employee = Employee.create!(email: 'steve@apple.com',
                                      password: '123456', firstname: 'Steve', surname: 'Jobs')
    apple = apple_employee.company
    apple.update(name: 'Apple', address: 'San Francisco', cnpj: '12345678911234')

    job_opportunity = JobOpportunity.create!(company: apple,
                                             job_title: 'Desenvolvedor',
                                             job_level: 'Nível superior',
                                             salary_range: 'Inbox',
                                             description: 'Uma boa oportunidade',
                                             place: 'home office',
                                             limit_date: '26/10/2021',
                                             number_of_positions: '5')

    candidate = Candidate.create!(email: 'juliette@gmail.com',
                                  password: '123456',
                                  firstname: 'Juliette',
                                  surname: 'Freire',
                                  cpf: '123456789',
                                  address: 'Brasil',
                                  about_me: 'testando')

    job_application = JobApplication.create!(candidate: candidate,
                                             job_opportunity: job_opportunity,
                                             status: 0)
    JobProposal.create!(company: apple,
                        job_application: job_application,
                        message: 'mensagem teste',
                        salary_proposal: '15000',
                        start_date: '01/01/2022',
                        candidate: candidate,
                        job_opportunity: job_opportunity)

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Área do candidato'
    expect(page).to have_content 'Propostas recebidas'
    expect(page).to have_link 'Desenvolvedor - Apple'
  end

  scenario 'and accepts it' do
    apple_employee = Employee.create!(email: 'steve@apple.com',
                                      password: '123456', firstname: 'Steve', surname: 'Jobs')
    apple = apple_employee.company
    apple.update(name: 'Apple', address: 'San Francisco', cnpj: '12345678911234')

    job_opportunity = JobOpportunity.create!(company: apple,
                                             job_title: 'Desenvolvedor',
                                             job_level: 'Nível superior',
                                             salary_range: 'Inbox',
                                             description: 'Uma boa oportunidade',
                                             place: 'home office',
                                             limit_date: '26/10/2021',
                                             number_of_positions: '5')

    candidate = Candidate.create(email: 'juliette@gmail.com',
                                 password: '123456',
                                 firstname: 'Juliette',
                                 surname: 'Freire',
                                 cpf: '123456789',
                                 address: 'Brasil',
                                 about_me: 'testando')

    job_application = JobApplication.create!(candidate: candidate,
                                             job_opportunity: job_opportunity,
                                             status: 0)
    JobProposal.create!(job_application: job_application,
                        message: 'mensagem teste',
                        salary_proposal: '15000',
                        start_date: '01/01/2022',
                        candidate: candidate,
                        company: apple,
                        job_opportunity: job_opportunity)

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Área do candidato'
    click_on 'Desenvolvedor - Apple'
    within('.accept-form') do
      fill_in 'start_date_confirmation', with: '01/01/2022'
      click_on 'Confirmar'
    end

    expect(page).to have_content 'Confirmação enviada com sucesso!'
    expect(JobProposal.first.status).to eq('accepted')
  end

  scenario 'and rejects it' do
    apple_employee = Employee.create!(email: 'steve@apple.com',
                                      password: '123456', firstname: 'Steve', surname: 'Jobs')
    apple = apple_employee.company
    apple.update(name: 'Apple', address: 'San Francisco', cnpj: '12345678911234')

    job_opportunity = JobOpportunity.create!(company: apple,
                                             job_title: 'Desenvolvedor',
                                             job_level: 'Pleno',
                                             salary_range: 'Inbox',
                                             description: 'Uma boa oportunidade',
                                             place: 'home office',
                                             limit_date: '26/10/2021',
                                             number_of_positions: '5')

    candidate = Candidate.create(email: 'juliette@gmail.com',
                                 password: '123456',
                                 firstname: 'Juliette',
                                 surname: 'Freire',
                                 cpf: '123456789',
                                 address: 'Brasil',
                                 about_me: 'testando')

    job_application = JobApplication.create!(candidate: candidate,
                                             job_opportunity: job_opportunity,
                                             status: 0)

    job_proposal = JobProposal.create(job_application: job_application,
                                      message: 'mensagem teste',
                                      salary_proposal: '15000',
                                      start_date: '01/01/2022',
                                      candidate: candidate,
                                      company: apple,
                                      job_opportunity: job_opportunity)

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Área do candidato'
    click_on 'Desenvolvedor - Apple'
    within('.reject-form') do
      fill_in 'rejection_motive', with: 'motivo teste'
      click_on 'Confirmar'
    end

    expect(page).to have_content 'Resposta enviada com sucesso'
    expect(JobProposal.first.status).to eq('rejected')
  end
end
