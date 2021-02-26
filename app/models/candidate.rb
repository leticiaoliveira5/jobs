class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_applications
  has_one :resume

  after_create :create_resume

  def create_resume
    Resume.create!(id: self.id, candidate: self)
  end

  def cancel_job_application!(job_opportunity, current_candidate)
    @job_application = JobApplication.find_by(job_opportunity: job_opportunity, candidate: current_candidate)
    @job_application.destroy!
  end


end
