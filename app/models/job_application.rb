class JobApplication < ApplicationRecord
  belongs_to :job_opportunity
  belongs_to :candidate
  has_one :job_proposal

  validate :candidate_must_have_cpf_and_address_information

  enum status: { waiting: 0, accepted: 1, declined: 2 }

  def candidate_must_have_cpf_and_address_information
    if candidate.cpf == nil || candidate.address == nil
      errors.add(:limit_date, "Candidato precisa ter informações básicas cadastradas") 
    end
  end

end
