class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_applications, dependent: :restrict_with_error
  has_many :job_proposals, dependent: :restrict_with_error
  has_many :work_experiences, dependent: :destroy
  has_many :candidate_skills, dependent: :destroy
  has_many :skills, through: :candidate_skills
  has_many :courses, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_one_attached :avatar

  validates :document, length: { is: 11 }, on: :update, allow_blank: true

  def full_name
    "#{firstname} #{surname}"
  end
end
