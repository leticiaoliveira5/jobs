require 'faker'

FactoryBot.define do
  factory :candidate do
    email { Faker::Internet.email }
    password { '123456' }
    firstname { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    document { '12345678911234' }
    address { 'Brasil' }
    about_me { 'Sou um candidato teste' }
    website { 'Site.com' }

    trait :without_info do
      document { nil }
      address { nil }
      about_me { nil }
    end

    trait :with_avatar do
      after(:build) do |candidate|
        candidate.avatar.attach(io: File.open(Rails.root.join('spec/fixtures/img.jpg')),
                                filename: 'img.jpg', content_type: 'image/jpeg')
      end
    end

    trait :with_invalid_format_avatar do
      after(:build) do |candidate|
        candidate.avatar.attach(io: File.open(Rails.root.join('spec/fixtures/text.txt')),
                                filename: 'text.txt', content_type: 'text/txt')
      end
    end
  end
end
