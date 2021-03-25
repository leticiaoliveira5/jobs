# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Candidate, type: :model do
  context '#create_resume' do
    it 'creates resume' do
      candidate = Candidate.create(email: 'juliette@gmail.com', password: '123456',
                                   firstname: 'Juliette', surname: 'Freire')

      expect(Resume.count).to eq(1)
      expect(candidate.resume).to be_truthy
    end
  end
end
