require 'rails_helper'

RSpec.describe JobApplication, type: :model do

  context '#destroy' do

    it  'deletes job application' do

      employee = Employee.create!(email: 'faustao@globo.com',
      password: '123456',
      firstname: 'Fausto', 
      surname:'Silva')

      company = Company.find_by(domain:'globo.com')
      company.update(name: 'Globo', domain:'globo.com', 
      address: 'Rio de Janeiro', cnpj: '12346')

      job_opportunity = JobOpportunity.create!(company: company, 
      job_title: 'Dummie', job_level: 'Nível médio', 
      salary_range: 'Salário mínimo',
      description: 'Auxiliar em diversas atividades', limit_date: '26/10/2021',
      place: 'Curicica - RJ', number_of_positions: 10)

      candidate = Candidate.create(email: 'karol@k.com', password: '123456',
      firstname: 'Karoline', surname: 'dos Santos')

      login_as candidate

      job_application = JobApplication.create(job_opportunity: job_opportunity, candidate: candidate,status:0)

      job_application.destroy!

      expect(candidate.job_applications.count).to eq(0)
      expect(JobApplication.count).to eq(0)

    end

  end

end
