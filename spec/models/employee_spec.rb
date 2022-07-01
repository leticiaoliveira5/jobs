require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe '#before_validation' do
    let(:subject) do
      described_class.create!(firstname: 'Steve',
                              surname: 'Jobs',
                              email: 'steve@apple.com',
                              password: '123456')
    end

    it 'creates company' do
      expect { subject }.to change(Company, :count).by(1)
      expect(Company.first.domain).to eq('apple.com')
    end

    it 'first employee is admin' do
      expect(subject.admin?).to eq true
      expect(subject.role).to eq 'admin'
    end
  end

  describe 'validations' do
    let(:subject) { described_class.new(company_id: nil) }

    it 'is not valid without basic attributes' do
      expect(subject).not_to be_valid
      expect(subject.errors).to include(:email,
                                        :password,
                                        :firstname,
                                        :surname,
                                        :company)
    end
  end

  describe 'company' do
    let!(:first_employee) do
      described_class.create!(firstname: 'Ronald',
                              surname: 'McDonald',
                              email: 'ronald@mcdonalds.com',
                              password: '123456')
    end

    let!(:second_employee) do
      described_class.create!(firstname: 'Bob',
                              surname: 'Spy',
                              email: 'bob@mcdonalds.com',
                              password: '123456')
    end

    it 'belongs to existing company if has the same domain' do
      expect(Company.count).to eq(1)
      expect(second_employee.company).to eq(first_employee.company)
    end

    it 'only the first employee is admin' do
      expect(first_employee.admin?).to eq true
      expect(second_employee.admin?).to eq false
      expect(second_employee.regular?).to eq true
      expect(second_employee.role).to eq 'regular'
    end
  end
end
