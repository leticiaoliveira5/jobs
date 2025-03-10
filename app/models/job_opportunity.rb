class JobOpportunity < ApplicationRecord
  belongs_to :company
  has_many :job_applications, dependent: :restrict_with_error
  has_many :job_proposals, through: :job_applications
  has_many :candidates, through: :job_applications

  validates :job_title, :description, :job_level, :salary_range, :place,
            :limit_date, :number_of_positions, presence: true
  validates :number_of_positions, numericality: { greater_than: 0 }
  validate :limit_date_cannot_be_in_the_past

  enum status: { active: 0, inactive: 1 }

  def limit_date_cannot_be_in_the_past
    return unless limit_date.present? && limit_date < DateTime.now

    errors.add(:limit_date, "Can't be in the past!")
  end

  def self.search(input)
    return self if input.blank?

    joins(:company)
      .where('job_title ILIKE ? OR name ILIKE ?', "%#{input}%", "%#{input}%")
  end
end
