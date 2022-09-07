require 'faker'

FactoryBot.define do
  factory :employee do
    company
    firstname { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { Faker::Internet.email(domain: company.domain) }
    password { '123456' }
  end
end
