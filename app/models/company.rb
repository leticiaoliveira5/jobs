class Company < ApplicationRecord

    has_many :employees
    has_many :job_opportunities
  

    validates :domain, :cnpj, uniqueness: true
    validates :domain, presence: true

   

end
