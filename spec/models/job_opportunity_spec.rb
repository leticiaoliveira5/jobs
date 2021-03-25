# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobOpportunity, type: :model do
  context 'validation' do
    it 'limit date cannot be in the past' do
      employee = Employee.create!(email: 'faustao@globo.com',
                                  password: '123456',
                                  firstname: 'Fausto',
                                  surname: 'Silva')

      company = Company.find_by(domain: 'globo.com')
      company.update(name: 'Globo', domain: 'globo.com',
                     address: 'Rio de Janeiro', cnpj: '1234678911234')

      job_opportunity = JobOpportunity.create(company: company,
                                              job_title: 'Dummie',
                                              job_level: 'Nível médio',
                                              salary_range: 'Salário mínimo',
                                              description: 'Auxiliar em diversas atividades',
                                              limit_date: '18/11/1958',
                                              place: 'Curicica - RJ', number_of_positions: 10)

      expect(JobOpportunity.count).to eq(0)
    end
  end

  context '#create_job_application' do
    it 'should create a job application' do
      employee = Employee.create!(email: 'faustao@globo.com',
                                  password: '123456',
                                  firstname: 'Fausto',
                                  surname: 'Silva')

      company = Company.find_by(domain: 'globo.com')
      company.update(name: 'Globo', domain: 'globo.com',
                     address: 'Rio de Janeiro', cnpj: '12346')

      job_opportunity = JobOpportunity.create!(company: company,
                                               job_title: 'Dummie', job_level: 'Nível médio',
                                               salary_range: 'Salário mínimo',
                                               description: 'Auxiliar em diversas atividades', limit_date: '26/10/2021',
                                               place: 'Curicica - RJ', number_of_positions: 10)

      candidate = Candidate.create(email: 'karol@k.com',
                                   password: '123456',
                                   firstname: 'Karoline',
                                   surname: 'dos Santos',
                                   cpf: '123456789',
                                   address: 'Brasil',
                                   about_me: 'testando')

      login_as candidate

      job_application = JobApplication.create!(job_opportunity: job_opportunity, candidate: candidate)

      expect(JobApplication.count).to eq(1)
      expect(job_application.candidate).to eq(candidate)
      expect(job_application.job_opportunity).to eq(job_opportunity)
    end
  end

  context '#check_number_of_positions' do
    it 'is deactivated when candidate accepts proposal' do
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
                                               number_of_positions: '1')

      candidate = Candidate.create(email: 'juliette@gmail.com', password: '123456',
                                   firstname: 'Juliette', surname: 'Freire')

      job_application = JobApplication.create(candidate: candidate,
                                              job_opportunity: job_opportunity,
                                              status: 0)

      job_proposal = JobProposal.create(company: apple,
                                        job_application: job_application,
                                        message: 'test message',
                                        salary_proposal: '5000',
                                        start_date: '20/05/2021',
                                        candidate: candidate,
                                        job_opportunity: job_opportunity)

      job_proposal.accepted!
      job_proposal.check_number_of_positions

      expect(job_opportunity.status).to eq 'inactive'
    end
  end
end
