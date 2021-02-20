class Company < ApplicationRecord

    has_many :employees

    validates :domain, uniqueness: true

end
