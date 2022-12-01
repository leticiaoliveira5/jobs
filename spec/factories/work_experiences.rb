FactoryBot.define do
  factory :work_experience do
    candidate
    job_title { 'art curator' }
    start_date { 1.year.ago }
  end
end
