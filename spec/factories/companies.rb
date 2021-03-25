FactoryBot.define do
  factory :company do
    name { 'Globo' }
    domain { 'globo.com' }
    address { 'Rio de Janeiro' }
    cnpj { '12345678911234' }
  end
end