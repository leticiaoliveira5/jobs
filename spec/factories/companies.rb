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

  trait :with_logo do
    after(:build) do |company|
      company.logo.attach(io: File.open(Rails.root.join('spec/fixtures/img.png')),
                          filename: 'img.jpg', content_type: 'image/png')
    end
  end

  trait :with_invalid_format_logo do
    after(:build) do |company|
      company.logo.attach(io: File.open(Rails.root.join('spec/fixtures/text.txt')),
                          filename: 'text.txt', content_type: 'text/txt')
    end
  end
end
