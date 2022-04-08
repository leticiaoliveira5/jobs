FactoryBot.define do
  factory :job_opportunity do
    job_title { 'Dummie' }
    job_level { 'Pleno' }
    description { 'Auxiliar em diversas atividades' }
    salary_range { 'Salário mínimo' }
    place { 'Curicica - RJ' }
    limit_date { 2.months.from_now }
    number_of_positions { '10' }
    company
  end
end
