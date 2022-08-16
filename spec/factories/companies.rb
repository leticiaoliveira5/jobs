FactoryBot.define do
  factory :company do
    name { 'Globe' }
    domain { 'globe.com' }
    address { 'Rio de Janeiro' }
    cnpj { '12345678911234' }
  end

  trait :with_employee do
    after(:create) do |company|
      create(:employee, company: company, email: "test@#{company.domain}")
    end
  end
end
