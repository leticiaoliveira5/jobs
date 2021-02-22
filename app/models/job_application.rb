class JobApplication < ApplicationRecord
  belongs_to :job_opportunity
  belongs_to :candidate

def cancel_job_application
  @job_application.destroy!
end
end
