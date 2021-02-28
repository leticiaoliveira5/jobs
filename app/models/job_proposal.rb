class JobProposal < ApplicationRecord

    belongs_to :job_application

    validates :message, :start_date, :salary_proposal, presence: true


end
