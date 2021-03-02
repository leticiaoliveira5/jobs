class AddStatusToJobProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :job_proposals, :status, :integer, default: 0
  end
end
