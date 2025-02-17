require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'creation' do
    let!(:first_employee) do
      Employee.create!(firstname: 'Ronald',
                       surname: 'McDonald',
                       email: 'ronald@mcdonalds.com',
                       password: '123456')
    end

    it { expect(described_class.count).to eq(1) }
    it { expect(described_class.first.domain).to eq('mcdonalds.com') }
    it { expect(first_employee.admin?).to eq true }
  end

  describe 'validations' do
    it { is_expected.to validate_content_type_of(:logo).allowing('image/png') }
    it { is_expected.to validate_size_of(:logo).less_than(0.5.megabytes) }
  end
end
