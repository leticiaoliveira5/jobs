FactoryBot.define do
  factory :job_proposal do
    job_application
    candidate { job_application.candidate }
    message { 'Mensagem teste' }
    salary_proposal { '15000' }
    start_date { 1.month.from_now }
  end
end
