class JobOpportunity < ApplicationRecord
  belongs_to :company

  validates :job_title, :description, :job_level, :salary_range, :place, presence: true

end
