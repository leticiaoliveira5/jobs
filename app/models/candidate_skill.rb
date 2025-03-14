class CandidateSkill < ApplicationRecord
  belongs_to :candidate
  belongs_to :skill

  delegate :name, to: :skill, prefix: true

  validates :skill_id, uniqueness: { scope: :candidate_id }

  attr_reader :name

  enum level: { beginner: 0, intermediate: 1, advanced: 2 }

  def self.level_humanized_names
    levels.map do |key, value|
      [I18n.t("activerecord.attributes.candidate_skill.level.#{key}"), value]
    end
  end
end
