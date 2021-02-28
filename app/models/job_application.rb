class JobApplication < ApplicationRecord
  belongs_to :job_opportunity
  belongs_to :candidate
  has_one :job_proposal

end
