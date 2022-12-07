class Degree < ApplicationRecord
  belongs_to :candidate

  validates :title, presence: true

  enum kind: { diploma: 0, bachelor: 1, graduate: 2, master: 3, doctorate: 4 }
end
