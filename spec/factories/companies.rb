FactoryBot.define do
  factory :company do
    name { 'Globe' }
    domain { 'globe.com' }
    address { 'Rio de Janeiro' }
    cnpj { '12345678911234' }
  end
end
