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
    context 'logo' do
      it 'validates content type' do
        company = build(:company, :with_invalid_format_logo)

        expect(company).to be_invalid
        expect(company.errors).to include(:logo)
      end

      # rubocop:disable RSpec/AnyInstance
      it 'validates size' do
        company = build(:company, :with_logo)

        allow_any_instance_of(ActiveStorage::Blob).to receive(:byte_size).and_return(1.megabyte)

        expect(company).to be_invalid
        expect(company.errors).to include(:logo)
      end
      # rubocop:enable RSpec/AnyInstance
    end
  end
end
