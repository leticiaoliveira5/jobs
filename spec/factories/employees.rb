require 'faker'

FactoryBot.define do
  factory :employee do
    firstname { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    email { 'fausto@globe.com' }
    password { '123456' }
    company
  end
end
