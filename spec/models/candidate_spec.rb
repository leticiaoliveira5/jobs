require 'rails_helper'

RSpec.describe Candidate, type: :model do
  describe '#after_create' do
    it 'creates resume after candidate creation' do
      expect do
        described_class.create(email: 'maria@gmail.com',
                               password: '123456',
                               firstname: 'Maria',
                               surname: 'Costa')
      end.to change(Resume, :count).by(1)
    end
  end
end
