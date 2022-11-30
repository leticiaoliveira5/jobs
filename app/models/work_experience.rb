class WorkExperience < ApplicationRecord
  belongs_to :candidate

  validates :job_title, :start_date, presence: true
end
