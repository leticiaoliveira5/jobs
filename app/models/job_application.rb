class JobApplication < ApplicationRecord
  belongs_to :job_opportunity
  belongs_to :candidate
  has_one :job_proposal

  enum status: { waiting: 0, accepted: 1, declined: 2 }

end
