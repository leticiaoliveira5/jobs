require 'rails_helper'

RSpec.describe Resume, type: :model do

  context 'creation' do

    it 'is created after candidate' do

      candidate = Candidate.create(email: 'juliette@gmail.com', password: '123456', 
      firstname: 'Juliette', surname: 'Freire')
      resume = candidate.resume

      expect(candidate.resume).to be_truthy
      expect(resume.id).to eq(candidate.id)
      expect(resume.candidate).to eq(candidate)

    end

  end

end
