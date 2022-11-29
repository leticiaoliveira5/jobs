class JobApplication < ApplicationRecord
  belongs_to :job_opportunity
  belongs_to :candidate
  has_one :company, through: :job_opportunity
  has_one :job_proposal, dependent: :destroy

  validate :candidate_must_have_basic_information

  enum status: { waiting: 0, accepted: 1, declined: 2 }

  def candidate_must_have_basic_information
    return unless candidate.document.nil? || candidate.address.nil? || candidate.about_me.nil?

    errors.add(:candidate, 'Candidato precisa ter informações básicas cadastradas')
  end
end
