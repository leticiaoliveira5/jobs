require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'creation' do
    before do
      Employee.create!(firstname: 'Ronald',
                       surname: 'McDonald',
                       email: 'ronald@mcdonalds.com',
                       password: '123456')
    end

    it { expect(described_class.count).to eq(1) }
    it { expect(described_class.first.domain).to eq('mcdonalds.com') }
    it { expect(first_employee.admin?).to eq true }
  end
end
