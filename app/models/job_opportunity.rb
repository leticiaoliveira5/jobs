class JobOpportunity < ApplicationRecord
  belongs_to :company
  has_many :job_applications

  validates :job_title, :description, :job_level, :salary_range, :place, :limit_date, :number_of_positions, presence: true
  validate :limit_date_cannot_be_in_the_past

  enum status: { active: 0, inactive: 1 }

  def self.search(search)
      self.joins(:company).where("job_title LIKE ? OR name LIKE ?","%#{search}%","%#{search}%")
      # sintaxe SQL para buscas no banco de dados
      # Like procura o texto independente da posição na string
  end   

  def limit_date_cannot_be_in_the_past
      if limit_date.present? && limit_date < DateTime.now 
        errors.add(:limit_date, "Can't be in the past!") 
      end
  end 


end
