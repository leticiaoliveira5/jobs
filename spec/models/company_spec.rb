require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'creation' do
    it 'is created after first employee' do
      first_employee = Employee.create!(firstname: 'Ronald',
                                        surname: 'McDonald',
                                        email: 'ronald@mcdonalds.com',
                                        password: '123456')

      expect(Company.count).to eq(1)
      expect(Company.all.first.domain).to eq('mcdonalds.com')
      expect(first_employee.admin?).to eq true
    end
  end
end
