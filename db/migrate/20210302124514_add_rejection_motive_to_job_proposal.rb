# frozen_string_literal: true

class AddRejectionMotiveToJobProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :job_proposals, :rejection_motive, :string
  end
end
