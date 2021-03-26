# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Candidate, type: :model do
  context '#create_resume' do
    it 'creates resume' do
      candidate = Candidate.create(email: 'maria@gmail.com',
                                   password: '123456',
                                   firstname: 'Maria',
                                   surname: 'Costa')

      expect(Resume.count).to eq(1)
      expect(candidate.resume).to be_truthy
    end
  end
end
