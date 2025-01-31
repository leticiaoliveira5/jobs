require 'faker'

FactoryBot.define do
  factory :address, class: 'address' do
    zipcode { '24738200' }
    street { 'Rua José Toledo da Silva' }
    neighborhood { 'Santa Isabel' }
    number { '1' }
    city { 'São Gonçalo' }
    state { 'RJ' }
    country { 'Brasil' }

    factory :candidate_address do
      resource { association(:candidate) }
    end
  end
end
