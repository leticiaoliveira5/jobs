class Language < ApplicationRecord
  belongs_to :candidate

  validates :name, :proficiency, presence: true

  enum proficiency: { beginner: 0, intermediate: 1, advanced: 2, fluent: 3 }
end
