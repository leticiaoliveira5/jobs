class Skill < ApplicationRecord
  has_many :candidate_skills, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.find_or_create_by_name(name)
    find_or_create_by(name: name[0].capitalize + name[1..].downcase)
  end
end
