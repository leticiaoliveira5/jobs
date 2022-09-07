class Company < ApplicationRecord
  has_many :employees, dependent: :restrict_with_error
  has_many :job_opportunities, dependent: :destroy
  has_many :job_proposals, through: :job_opportunities
  has_many :job_applications, through: :job_opportunities
  has_many :active_job_opportunities, -> { where(status: :active) },
           class_name: 'JobOpportunity', inverse_of: :company
  has_many :inactive_job_opportunities, -> { where(status: :inactive) },
           class_name: 'JobOpportunity', inverse_of: :company

  validates :domain, presence: true
  validates :name, :address, :cnpj, presence: true, on: :update
  validates :cnpj, length: { is: 14 }, on: :update
  validates :domain, :cnpj, uniqueness: true
end
