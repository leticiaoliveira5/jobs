# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

### COMPANY: startv

Employee.create!(email: 'fatima@startv.com', password: '123456',
                 firstname: 'Fatima', surname: 'Antunes')
Employee.create!(email: 'monique@startv.com', password: '123456',
                 firstname: 'Monique', surname: 'Antunes')

company = Company.find_by(domain: 'startv.com')
company.update(name: 'StarTV', domain: 'startv.com',
               address: 'Rio de Janeiro', cnpj: '12346125878')

job_opportunity = JobOpportunity.create!(company: company,
                                         job_title: 'Dummie', job_level: 'Nível médio',
                                         salary_range: 'Salário mínimo',
                                         description: 'Auxiliar em diversas atividades',
                                         place: 'Curicica - RJ',
                                         number_of_positions: '10')

job_opportunity = JobOpportunity.create!(company: company,
                                         job_title: 'Atriz', job_level: 'Nível médio',
                                         salary_range: 'A combinar',
                                         description: 'Atuar nas novelas e séries da emissora',
                                         place: 'Curicica - RJ',
                                         number_of_positions: '1')

### COMPANY: FLY

Employee.create!(email: 'arthur@fly.com', password: '123456',
                 firstname: 'Arthur', surname: 'Antunes')
another_company = Company.find_by(domain: 'fly.com')
another_company.update(name: 'Fly', domain: 'fly.com',
                       address: 'Brasília', cnpj: '15556945061')

job_opportunity = JobOpportunity.create!(company: another_company,
                                         job_title: 'Comissário de bordo',
                                         job_level: 'Nível médio',
                                         salary_range: 'A combinar',
                                         description: 'Cumprir todos os procedimentos de segurança a bordo das aeronaves',
                                         place: 'São Paulo',
                                         number_of_positions: '2')

### CANDIDATES

Candidate.create(email: 'aline@email.com',
                 password: '123456', firstname: 'Aline', surname: 'dos Santos')
Candidate.create(email: 'bianca@email.com',
                 password: '123456', firstname: 'Bianca', surname: 'da Silva')
