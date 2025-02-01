require 'faker'

FactoryBot.define do
  factory :address, class: 'address' do
    zipcode { Faker::Address.zip_code }
    street { Faker::Address.street_name }
    number { '1' }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }

    factory :candidate_address do
      resource { association(:candidate) }
    end
  end
end
