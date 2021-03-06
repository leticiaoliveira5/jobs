class Company < ApplicationRecord

    has_many :employees
    has_many :job_opportunities
    has_many :job_proposals
  
    validates :name, :address, :cnpj, :domain, presence: true, on: :update
    validates :cnpj, length: { is: 14 }, on: :update
    validates :domain, presence: true
    validates :domain, :cnpj, uniqueness: true
   
    def self.search(search)
        self.where("name LIKE ?","%#{search}%")
        # sintaxe SQL para buscas no banco de dados
        # Like procura o texto independente da posição na string
    end   

end
