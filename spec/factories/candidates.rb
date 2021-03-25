FactoryBot.define do
  factory :candidate do
    email { 'maria@gmail.com' }
    password { '123456' }
    firstname { 'Maria' }
    surname { 'José' }
    cpf { '12345678911234' }
    address { 'Brasil' }
    about_me { 'Sou um candidato teste' }
  end
end