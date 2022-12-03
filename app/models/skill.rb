class Skill < ApplicationRecord
  has_many :candidate_skills, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
