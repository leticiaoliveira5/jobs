class JobProposal < ApplicationRecord

    belongs_to :job_application
    belongs_to :candidate

    validates :message, :start_date, :salary_proposal, presence: true

    enum status: { waiting: 0, accepted: 1, rejected: 2 }

end
