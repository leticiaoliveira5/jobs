# frozen_string_literal: true

class AddJobApplicationReferenceToJobProposal < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_proposals, :job_application, foreign_key: true
  end
end
