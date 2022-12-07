class Language < ApplicationRecord
  belongs_to :candidate

  validates :name, :proficiency, presence: true

  has_enumeration_for :proficiency, with: Proficiencies
end
