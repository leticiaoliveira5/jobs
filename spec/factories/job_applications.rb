FactoryBot.define do
  factory :job_application do
    candidate
    job_opportunity
    status { 0 }
  end
end
