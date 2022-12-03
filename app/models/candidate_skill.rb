class CandidateSkill < ApplicationRecord
  belongs_to :candidate
  belongs_to :skill

  attr_reader :name

  enum level: { beginner: 0, intermediate: 1, advanced: 2 }

  def self.level_humanized_names
    levels.keys.map { |key| I18n.t("activerecord.attributes.candidate_skill.level.#{key}") }
  end
end
