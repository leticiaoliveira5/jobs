class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, :surname, presence: true

  belongs_to :company

  before_validation :find_or_create_company

  def find_or_create_company
    
    email_domain = self.email.split('@').last
    @company = Company.find_or_create_by(domain: email_domain)
    self.company = @company

  end

end
