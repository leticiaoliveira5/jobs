class Company < ApplicationRecord
  has_many :employees, dependent: :restrict_with_error
  has_many :job_opportunities, dependent: :destroy
  has_many :job_proposals, through: :job_opportunities

  validates :domain, presence: true
  validates :name, :address, :cnpj, presence: true, on: :update
  validates :cnpj, length: { is: 14 }, on: :update
  validates :domain, :cnpj, uniqueness: true

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
