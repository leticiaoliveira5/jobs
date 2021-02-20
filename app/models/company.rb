class Company < ApplicationRecord

    has_many :employees
    has_many :jobs

    validates :domain, uniqueness: true
    validates :domain, presence: true


end
