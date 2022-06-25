class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company

  validates :firstname, :surname, :company_id, presence: true

  enum role: { regular: 0, admin: 1 }

  before_validation :find_or_create_company
  after_create :first_employee_is_admin

  def find_or_create_company
    email_domain = email.split('@').last
    @company = Company.find_or_create_by(domain: email_domain)
    if @company.present?
      self.company = @company
    end
  end

  def first_employee_is_admin
    admin! if self == @company.employees.first
  end
end
