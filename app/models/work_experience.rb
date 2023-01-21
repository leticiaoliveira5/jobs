class WorkExperience < ApplicationRecord
  before_save :set_status

  belongs_to :candidate

  validates :job_title, :start_date, presence: true
  validate :end_date_is_after_start_date

  enum status: { finished: 0, current: 1 }

  has_enumeration_for :sector, with: Sectors

  def set_status
    return if end_date.blank?

    self.status = 0 if end_date < DateTime.now
  end

  def end_date_is_after_start_date
    return if end_date.blank?

    errors.add(:end_date, :invalid) if start_date > end_date
  end
end
