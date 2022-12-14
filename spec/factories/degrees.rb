FactoryBot.define do
  factory :degree do
    candidate
    title { 'Diploma' }
    graduation_year { 2002 }
    kind { 1 }
  end
end
