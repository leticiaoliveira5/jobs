class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_applications, dependent: :restrict_with_error
  has_many :job_proposals, dependent: :restrict_with_error
  has_many :work_experiences, dependent: :destroy
  has_many :candidate_skills, dependent: :destroy
  has_one :resume, dependent: :destroy
  has_one_attached :avatar

  validates :document, length: { is: 11 }, on: :update, allow_blank: true

  after_create :create_resume

  def create_resume
    Resume.create!(candidate: self)
  end

  def full_name
    "#{firstname} #{surname}"
  end
end
