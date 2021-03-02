class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_applications
  has_many :job_proposals
  has_one :resume

  validates :cpf, length: { is: 11 }, on: :update, allow_blank: true

  after_create :create_resume

  def create_resume
    Resume.create!(candidate: self)
  end

end
