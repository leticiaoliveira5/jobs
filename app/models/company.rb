# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :employees, dependent: :restrict_with_error
  has_many :job_opportunities, dependent: :destroy
  has_many :job_proposals, through: :job_opportunities

  validates :name, :address, :cnpj, :domain, presence: true, on: :update
  validates :cnpj, length: { is: 14 }, on: :update
  validates :domain, presence: true
  validates :domain, :cnpj, uniqueness: true

  def self.search(search)
    where('name LIKE ?', "%#{search}%")
  end
end
