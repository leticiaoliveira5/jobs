require 'rails_helper'

RSpec.describe Resume, type: :model do
  context 'creation' do
    it 'is created after candidate' do
      candidate = Candidate.create(email: 'maria@gmail.com',
                                   password: '123456',
                                   firstname: 'Maria',
                                   surname: 'Pereira')
      resume = candidate.resume

      expect(candidate.resume).to be_truthy
      expect(resume.candidate).to eq candidate
      expect(Resume.count).to eq 1
    end
  end
end
