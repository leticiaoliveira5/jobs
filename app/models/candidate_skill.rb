class CandidateSkill < ApplicationRecord
  belongs_to :candidate
  belongs_to :skill

  attr_reader :name
  
  enum level: { beginner: 0, intermediate: 1, advanced: 2 }
end
