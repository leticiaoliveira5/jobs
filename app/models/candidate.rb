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
  has_many :degrees, dependent: :destroy
  has_one :address, as: :resource, dependent: :destroy

  has_one_attached :avatar

  accepts_nested_attributes_for :address

  validates :document, length: { is: 11 }, on: :update, allow_blank: true
  validate :avatar_validation

  delegate :to_line, to: :address, prefix: true, allow_nil: true
  delegate :short_form, to: :address, prefix: true, allow_nil: true

  def self.search(search)
    return self if search.blank?

    left_joins(:address).where('firstname ILIKE ? OR surname ILIKE ? OR addresses.city ILIKE ?',
                               "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def full_name
    "#{firstname} #{surname}"
  end

  def avatar_validation
    return if avatar.blank?

    errors.add(:avatar, :content_type) if avatar.content_type != 'image/jpeg'
    errors.add(:avatar, :size) if avatar.byte_size > 0.5.megabyte
  end
end
