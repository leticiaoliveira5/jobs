class AddCompanyReferenceToJobProposal < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_proposals, :company, foreign_key: true
  end
end
