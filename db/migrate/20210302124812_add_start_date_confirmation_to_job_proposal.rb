# frozen_string_literal: true

class AddStartDateConfirmationToJobProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :job_proposals, :start_date_confirmation, :string
  end
end
