class JobProposal < ApplicationRecord

    belongs_to :job_application
    belongs_to :candidate
    belongs_to :company
    belongs_to :job_opportunity

    validates :message, :start_date, :salary_proposal, presence: true

    enum status: { waiting: 0, accepted: 1, rejected: 2 }

    def check_number_of_positions
        number_of_positions = self.job_application.job_opportunity.number_of_positions
        number_of_confirmations = JobProposal.where(job_opportunity: self.job_opportunity, status: 'accepted').count
        if number_of_positions == number_of_confirmations
            self.job_application.job_opportunity.inactive!
        end
    end

end
