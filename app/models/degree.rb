class Degree < ApplicationRecord
  belongs_to :candidate

  validates :title, :graduation_year, presence: true

  has_enumeration_for :kind, with: DegreeKinds
end
