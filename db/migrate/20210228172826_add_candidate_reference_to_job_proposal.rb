# frozen_string_literal: true

class AddCandidateReferenceToJobProposal < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_proposals, :candidate, foreign_key: true
  end
end
