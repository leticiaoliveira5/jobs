FactoryBot.define do
  factory :employee do
    firstname { 'Fausto' }
    surname { 'Silva' }
    email { 'fausto@globo.com' }
    password { '123456' }
    company
  end
end
