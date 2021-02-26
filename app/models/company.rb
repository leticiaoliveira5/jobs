class Company < ApplicationRecord

    has_many :employees
    has_many :job_opportunities
  
    validates :name, :address, :cnpj, presence: true, on: :update
    validates :domain, presence: true
    validates :domain, :cnpj, uniqueness: true
   
    def self.search(search)
        self.where("name LIKE ?","%#{search}%")
        # sintaxe SQL para buscas no banco de dados
        # Like procura o texto independente da posição na string
    end   

end
