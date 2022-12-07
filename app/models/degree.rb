class Degree < ApplicationRecord
  belongs_to :candidate

  validates :title, presence: true

  has_enumeration_for :kind, with: DegreeKinds
end
