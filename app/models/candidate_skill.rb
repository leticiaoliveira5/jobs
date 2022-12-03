class CandidateSkill < ApplicationRecord
  belongs_to :candidate
  belongs_to :skill

  attr_reader :name
end
