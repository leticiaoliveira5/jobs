FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    domain { Faker::Internet.domain_name(domain: name) }
    document { Faker::Company.brazilian_company_number.to_s }

    after(:build) do |company|
      company.address = build(:address, resource: company)
    end
  end

  trait :with_employee do
    after(:create) do |company|
      create(:employee, company: company,
                        email: Faker::Internet.email(domain: company.domain))
    end
  end
end
