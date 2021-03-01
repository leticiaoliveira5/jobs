require 'rails_helper'

RSpec.describe JobProposal, type: :model do

  context 'validation' do

    it 'can not be created without fields' do

      apple_employee = Employee.create!(email: 'steve@apple.com',
      password: '123456', firstname: 'Steve', surname:'Jobs')
      apple = apple_employee.company
      apple.update(name:'Apple', address: 'San Francisco', cnpj: '123456789')

      job_opportunity = JobOpportunity.create!(company: apple, 
          job_title: 'Desenvolvedor',
          job_level: 'Nível superior', 
          salary_range: 'Inbox',
          description: 'Uma boa oportunidade',
          place: 'home office',        
          limit_date: '26/10/2021',
          number_of_positions: '5')

      candidate = Candidate.create(email: 'juliette@gmail.com', password: '123456', 
                                  firstname: 'Juliette', surname: 'Freire')

      job_application = JobApplication.create(candidate: candidate, 
                              job_opportunity: job_opportunity,
                              status:0)

      job_proposal = JobProposal.create(job_application: job_application, 
                          message:'',
                          salary_proposal:'',
                          start_date: '',
                          candidate:candidate) 

      expect(JobProposal.count).to eq(0)
      expect(job_proposal.errors.count).to eq(3)

    end

  end

end
