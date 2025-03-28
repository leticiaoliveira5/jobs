class JobProposal < ApplicationRecord
  belongs_to :job_application
  belongs_to :candidate
  has_one :company, through: :job_opportunity
  has_one :job_opportunity, through: :job_application

  validates :message, :start_date, :salary_proposal, presence: true

  enum status: { waiting: 0, accepted: 1, rejected: 2 }

  def check_number_of_positions
    number_of_positions = job_opportunity.number_of_positions
    number_of_confirms = JobProposal.where(
      job_application: JobApplication.find_by(job_opportunity: job_opportunity),
      status: 'accepted'
    ).count
    job_application.job_opportunity.inactive! if number_of_positions == number_of_confirms
  end

  delegate :job_title, to: :job_opportunity

  def company
    job_opportunity.company.name
  end
end
