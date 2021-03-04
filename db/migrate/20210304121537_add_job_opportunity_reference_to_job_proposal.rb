class AddJobOpportunityReferenceToJobProposal < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_proposals, :job_opportunity, foreign_key: true
  end
end
