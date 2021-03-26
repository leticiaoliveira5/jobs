FactoryBot.define do
  factory :employee do
    firstname { 'Fausto' }
    surname { 'Silva' }
    email { 'fausto@globe.com' }
    password { '123456' }
    company
  end
end
