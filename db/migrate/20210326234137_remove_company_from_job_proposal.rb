class RemoveCompanyFromJobProposal < ActiveRecord::Migration[6.1]
  def change
    remove_reference(:job_proposals, :company)
  end
end
