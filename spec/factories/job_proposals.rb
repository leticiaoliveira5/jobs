FactoryBot.define do
  factory :job_proposal do
    job_application
    message { 'Mensagem teste' }
    salary_proposal { '15000' }
    start_date { '01/01/2022' }
  end
end
