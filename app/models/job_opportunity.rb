class JobOpportunity < ApplicationRecord
  belongs_to :company
  has_many :job_applications

  validates :job_title, :description, :job_level, :salary_range, :place, presence: true


  def create_job_application!(job_opportunity, current_candidate)
    JobApplication.create!(job_opportunity: job_opportunity, 
    candidate: current_candidate)
 end


end
