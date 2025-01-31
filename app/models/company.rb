class Company < ApplicationRecord
  has_many :employees, dependent: :restrict_with_error
  has_many :job_opportunities, dependent: :destroy
  has_many :job_proposals, through: :job_opportunities
  has_many :job_applications, through: :job_opportunities
  has_many :active_job_opportunities, -> { where(status: :active) },
           class_name: 'JobOpportunity', inverse_of: :company
  has_many :inactive_job_opportunities, -> { where(status: :inactive) },
           class_name: 'JobOpportunity', inverse_of: :company

  has_one :address, as: :resource

  accepts_nested_attributes_for :address

  validates :domain, presence: true
  validates :name, :document, presence: true, on: :update
  validates :document, length: { is: 14 }, on: :update
  validates :domain, :document, uniqueness: true

  def to_param
    return nil unless persisted?

    "#{id}-#{name&.gsub(/[^0-9A-Za-z]/, '')}"
  end

  def self.search(input)
    return self if input.blank?

    left_joins(:address).where('name ILIKE ? OR addresses.city ILIKE ? OR domain ILIKE ?',
                               "%#{input}%", "%#{input}%", "%#{input}%")
  end
end
