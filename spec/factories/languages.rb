FactoryBot.define do
  factory :language do
    name { 'English' }
    proficiency { 1 }
    candidate
  end
end
