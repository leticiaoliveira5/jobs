# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

### COMPANY: Jobs

Employee.create!(email: 'admin@jobs.com',
                 password: '123456',
                 firstname: 'Admin',
                 surname: 'Admin')

company = Company.find_by(domain: 'jobs.com')
company.update(name: 'Jobs',
               address: 'Rio de Janeiro',
               document: Faker::Company.brazilian_company_number.to_s)

JobOpportunity.create!(company: company,
                       job_title: 'Dummie',
                       job_level: 'Nível médio',
                       salary_range: 'Salário mínimo',
                       description: 'Auxiliar em diversas atividades',
                       place: 'Curicica - RJ',
                       number_of_positions: '10',
                       limit_date: 1.year.from_now)

JobOpportunity.create!(company: company,
                       job_title: 'Atriz',
                       job_level: 'Nível médio',
                       salary_range: 'A combinar',
                       description: 'Atuar nas novelas e séries da emissora',
                       place: 'Curicica - RJ',
                       number_of_positions: '1',
                       limit_date: 1.year.from_now)

### CANDIDATE

Candidate.create(email: 'candidate@email.com',
                 password: '123456',
                 firstname: 'Candidate',
                 surname: 'Jobs',
                 cpf: '46733146037',
                 address: 'Av. Pereira',
                 about_me: 'This is Me')

