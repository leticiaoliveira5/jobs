FactoryBot.define do
  factory :job_opportunity do
    job_title { 'Dummie' }
    job_level { 'Pleno' }
    description { 'Auxiliar em diversas atividades' }
    salary_range { 'Salário mínimo' }
    place { 'Curicica - RJ' }
    limit_date { '26/10/2021' }
    number_of_positions { '10' }
    company
  end
end