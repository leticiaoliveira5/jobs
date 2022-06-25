# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

### COMPANY: Jobs

Employee.create!(email: 'admin@jobs.com',
                 password: '123456',
                 firstname: 'Admin',
                 surname: 'Admin')

company = Company.find_by(domain: 'jobs.com')
company.update(name: 'Jobs',
               address: 'Rio de Janeiro',
               cnpj: '12346125878')

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

### CANDIDATES

Candidate.create(email: 'candidate@email.com',
                 password: '123456',
                 firstname: 'Candidate',
                 surname: 'Jobs')
