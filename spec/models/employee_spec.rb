# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'company' do
    it 'belongs to existing company if has the same domain' do
      first_employee = Employee.create!(firstname: 'Ronald',
                                        surname: 'McDonald',
                                        email: 'ronald@mcdonalds.com',
                                        password: '123456')
      second_employee = Employee.create!(firstname: 'Bob',
                                         surname: 'Spy',
                                         email: 'bob@mcdonalds.com',
                                         password: '123456')

      expect(Company.count).to eq(1)
      expect(second_employee.company).to eq(first_employee.company)
    end
  end

  context 'role' do
    it 'first employee is admin' do
      first_employee = Employee.create!(firstname: 'Ronald',
                                        surname: 'McDonald',
                                        email: 'ronald@mcdonalds.com',
                                        password: '123456')

      expect(Company.count).to eq(1)
      expect(Company.all.first.domain).to eq('mcdonalds.com')
      expect(first_employee.admin?).to eq true
      expect(first_employee.role).to eq 'admin'
    end

    it 'other employees are regulars' do
      first_employee = Employee.create!(firstname: 'Ronald',
                                        surname: 'McDonald',
                                        email: 'ronald@mcdonalds.com',
                                        password: '123456')
      second_employee = Employee.create!(firstname: 'Bob',
                                         surname: 'Spy',
                                         email: 'bob@mcdonalds.com',
                                         password: '123456')

      expect(Company.count).to eq(1)
      expect(first_employee.admin?).to eq true
      expect(second_employee.admin?).to eq false
      expect(second_employee.regular?).to eq true
      expect(second_employee.role).to eq 'regular'
    end
  end
end
